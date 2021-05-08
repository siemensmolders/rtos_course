################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.c 

OBJS += \
./ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.o 

C_DEPS += \
./ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.d 


# Each subdirectory must supply rules for building sources it contributes
ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.o: ../ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.c ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1/port.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

