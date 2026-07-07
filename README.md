# Simulacion-LTE-MIMO-MATLAB
Simulación en MATLAB del rendimiento de sistemas multi-antena (MIMO, MISO, SIMO) en una celda LTE, analizando SNR, BER y scheduling adaptativo multiusuario.
#  Simulación de Sistemas Multi-Antena (MIMO/MISO/SIMO) en LTE

Este proyecto de simulación en **MATLAB** evalúa el rendimiento de la capa física de diferentes configuraciones de sistemas de múltiples antenas en el enlace descendente de una celda LTE. Se analizan métricas clave como la Relación Señal a Ruido (SNR), la Tasa de Error de Bit (BER) y la Tasa de Transmisión bajo condiciones realistas de desvanecimiento.

##  Características Principales

* **Modelado de Canal:** Implementación de un canal Rayleigh plano en frecuencia y selectivo en tiempo, con una frecuencia Doppler de 50 Hz, ancho de banda de 10 MHz y frecuencia portadora de 1.8 GHz.
* **Configuraciones de Antenas:** Simulación y comparación de 4 esquemas distintos:
  * SIMO 1x4 (Conocimiento perfecto del canal).
  * MISO 4x1 (Conocimiento perfecto del canal).
  * MIMO 4x4 (Conocimiento perfecto en Tx y Rx).
  * MIMO 4x4 (Conocimiento exclusivo en Rx, con distribución equitativa de potencia en Tx).
* **Scheduling Adaptativo Multiusuario:** Implementación de un sistema MISO multiusuario (10 usuarios distribuidos aleatoriamente en 800x800 m²) que asigna recursos al usuario con mejor canal SISO equivalente.
* **Adaptación de Enlace (MCS):** Conmutación entre modulaciones para maximizar la eficiencia espectral garantizando una BER < 10^-3:
  * Codificación de 7/8 con modulación 64QAM.
  * Codificación de 3/4 con modulación 16QAM.
* **Análisis Estadístico:** Ejecución de simulaciones de Monte Carlo (100 distribuciones espaciales y 10^6 realizaciones de pequeña escala) para obtener las Funciones de Distribución Acumulada (CDF) de la BER y la tasa de transmisión.

##  Tecnologías y Herramientas

* **MATLAB:** Lenguaje principal utilizado para la algoritmia y generación de gráficas (PDFs y CDFs).
* **MATLAB Live Scripts (.mlx):** Utilizados para la integración de código, resultados y narrativa técnica (`Proyecto_Final.mlx`).
* **Archivos .mux:** Modelos y funciones para la generación del escenario y el canal (`generar_canal.mux`, `generar_escenario.mux`, etc.).

##  Cómo ejecutar el proyecto

1. Clona el repositorio:
   ```bash
   git clone [https://github.com/nmisu/Simulacion-LTE-MIMO-MATLAB.git](https://github.com/nmisu/Simulacion-LTE-MIMO-MATLAB.git)
