################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/gpio.c \
../Core/Src/main.c \
../Core/Src/stm32f7xx_hal_msp.c \
../Core/Src/stm32f7xx_hal_timebase_tim.c \
../Core/Src/stm32f7xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/system_stm32f7xx.c \
../Core/Src/usart.c 

OBJS += \
./Core/Src/gpio.o \
./Core/Src/main.o \
./Core/Src/stm32f7xx_hal_msp.o \
./Core/Src/stm32f7xx_hal_timebase_tim.o \
./Core/Src/stm32f7xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/system_stm32f7xx.o \
./Core/Src/usart.o 

C_DEPS += \
./Core/Src/gpio.d \
./Core/Src/main.d \
./Core/Src/stm32f7xx_hal_msp.d \
./Core/Src/stm32f7xx_hal_timebase_tim.d \
./Core/Src/stm32f7xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/system_stm32f7xx.d \
./Core/Src/usart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/gpio.o: ../Core/Src/gpio.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/gpio.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/main.o: ../Core/Src/main.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/stm32f7xx_hal_msp.o: ../Core/Src/stm32f7xx_hal_msp.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f7xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/stm32f7xx_hal_timebase_tim.o: ../Core/Src/stm32f7xx_hal_timebase_tim.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f7xx_hal_timebase_tim.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/stm32f7xx_it.o: ../Core/Src/stm32f7xx_it.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32f7xx_it.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/syscalls.o: ../Core/Src/syscalls.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/system_stm32f7xx.o: ../Core/Src/system_stm32f7xx.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/system_stm32f7xx.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src/usart.o: ../Core/Src/usart.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g -DDEBUG -DUSE_HAL_DRIVER -DSTM32F750xx -c -I../Drivers/CMSIS/Include -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/Config" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/OS" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/SEGGER/SEGGER" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/include" -I"/Users/siemen/repos/rtos_course/RTOS_workspace/001Tasks/ThirdParty/FreeRTOS/portable/GCC/ARM_CM7/r0p1" -I../Drivers/CMSIS/Device/ST/STM32F7xx/Include -I../Core/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc -I../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/usart.d" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

