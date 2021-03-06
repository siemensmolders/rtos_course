/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

// enable MCU cyclecounting, allowing timestamping for segger sysview
#define SEGGER_DEMCR						( *(volatile uint32_t *) (0xE000EDFC))
#define SEGGER_SYSVIEW_ENABLE_DBG()			( SEGGER_DEMCR |= (1 << 24) )

#define SEGGER_DWT_BASE						0xE0001000UL
#define SEGGER_DWT_LAR 						( *(volatile uint32_t *)(SEGGER_DWT_BASE + 0xFB0) )
#define MAGIC_KEY_WRITEACCESS 				(0xC5ACCE55)
#define SEGGER_GET_DBG_WRITEACCESS()		( SEGGER_DWT_LAR = MAGIC_KEY_WRITEACCESS)
#define SEGGER_DWT_CTRL 					( *(volatile uint32_t *)(SEGGER_DWT_BASE + 0) )
#define SEGGER_SYSVIEW_ENABLE_TIMESTAMP() 	(SEGGER_DWT_CTRL |= (1 << 0))
#define SEGGER_DWT_CYCCNT 					( *(volatile uint32_t *)(SEGGER_DWT_BASE + 4) )


/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
TaskHandle_t task1_handle;
TaskHandle_t task2_handle;
BaseType_t status;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
extern void USART1_IRQHandler();
static void task1_handler(void* parameters);
static void task2_handler(void* parameters);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

extern void SEGGER_UART_init(uint32_t);
extern void startSysViewCustom(void);

// void vApplicationTickHook(void){
// 	SEGGER_SYSVIEW_PrintfTarget("Tick.");
// }
/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */
  SEGGER_GET_DBG_WRITEACCESS();
  SEGGER_SYSVIEW_ENABLE_DBG();
  SEGGER_SYSVIEW_ENABLE_TIMESTAMP();
  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */

  SEGGER_UART_init(500000);

  SEGGER_SYSVIEW_Conf();
  startSysViewCustom(); // added here, because I'm not receiving that SysView hello string...

  traceSTART();

  status = xTaskCreate(task1_handler,  "Task-1",  200, "Hello world from Task-1\n", 2, &task1_handle);
  configASSERT(status == pdPASS);

  status = xTaskCreate(task2_handler,  "Task-2",  200, "Hello world from Task-2\n", 2, &task2_handle);
  configASSERT(status == pdPASS);

  vTaskStartScheduler();
  // Once scheduler starts, this function only exits if vTaskEndScheduler() is called from a task

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 168;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInitStruct.PeriphClockSelection = RCC_PERIPHCLK_USART1;
  PeriphClkInitStruct.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK2;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
#define CPUID_CUSTOM  	*((volatile uint32_t*) (0xE000E000UL + 0x0D00UL) )

void print_cpuId(void) {
	printf("CPU ID: %08X \n", (unsigned int)CPUID_CUSTOM);
}

void print_cpuVariant(void) {
	uint32_t cpuid_rvalue = (CPUID_CUSTOM >> 20) & 0x0000000F;
	uint32_t cpuid_pvalue = CPUID_CUSTOM & 0x0000000F;
	printf("Variant: r%lup%lu \n", cpuid_rvalue, cpuid_pvalue);
}


static void task1_handler(void* parameters)
{

	char msg[100];
	while(1){
		// printf("%s", (char *)parameters);
		snprintf(msg, 100, (char *)parameters);
		SEGGER_SYSVIEW_PrintfTarget(msg);

		// print_cpuId();
		// print_cpuVariant();

		taskYIELD();
	}

	return;
}

static void task2_handler(void* parameters)
{
	char msg[100];
	while(1){
		// printf("%s", (char *)parameters);
		snprintf(msg, 100, (char *)parameters);
		SEGGER_SYSVIEW_PrintfTarget(msg);

		taskYIELD();
	}

	return;
}

void vAssertCalled(  uint32_t ulLine, const char *pcFile )
{
    /* Called if an assertion passed to configASSERT() fails.  See
    http://www.freertos.org/a00110.html#configASSERT for more information. */
	for(;;);
}
/* USER CODE END 4 */

 /**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM6 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */

  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM6) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */

  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
