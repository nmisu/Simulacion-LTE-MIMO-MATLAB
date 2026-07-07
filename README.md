# Simulacion-LTE-MIMO-MATLAB
Simulación en MATLAB del rendimiento de sistemas multi-antena (MIMO, MISO, SIMO) en una celda LTE, analizando SNR, BER y scheduling adaptativo multiusuario.
# 📡 Simulación de Sistemas Multi-Antena (MIMO/MISO/SIMO) en LTE

Este proyecto de simulación en **MATLAB** evalúa el rendimiento de la capa física de diferentes configuraciones de sistemas de múltiples antenas en el enlace descendente de una celda LTE[cite: 7]. Se analizan métricas clave como la Relación Señal a Ruido (SNR), la Tasa de Error de Bit (BER) y la Tasa de Transmisión bajo condiciones realistas de desvanecimiento[cite: 7].

##  Características Principales

* **Modelado de Canal:** Implementación de un canal Rayleigh plano en frecuencia y selectivo en tiempo, con una frecuencia Doppler de 50 Hz, ancho de banda de 10 MHz y frecuencia portadora de 1.8 GHz[cite: 7, 9].
* **Configuraciones de Antenas:** Simulación y comparación de 4 esquemas distintos:
  * SIMO $1\times4$ (Conocimiento perfecto del canal)[cite: 7].
  * MISO $4\times1$ (Conocimiento perfecto del canal)[cite: 7].
  * MIMO $4\times4$ (Conocimiento perfecto en Tx y Rx)[cite: 7].
  * MIMO $4\times4$ (Conocimiento exclusivo en Rx, con distribución equitativa de potencia en Tx)[cite: 7].
* **Scheduling Adaptativo Multiusuario:** Implementación de un sistema MISO multiusuario (10 usuarios distribuidos aleatoriamente en $800\times800$ $m^2$) que asigna recursos al usuario con mejor canal SISO equivalente[cite: 7, 9].
* **Adaptación de Enlace (MCS):** Conmutación entre modulaciones para maximizar la eficiencia espectral garantizando una $\text{BER} < 10^{-3}$:
  * Codificación de $7/8$ con modulación 64QAM[cite: 7].
  * Codificación de $3/4$ con modulación 16QAM[cite: 7].
* **Análisis Estadístico:** Ejecución de simulaciones de Monte Carlo (100 distribuciones espaciales y $10^6$ realizaciones de pequeña escala) para obtener las Funciones de Distribución Acumulada (CDF) de la BER y la tasa de transmisión[cite: 7, 9].

##  Tecnologías y Herramientas

* **MATLAB:** Lenguaje principal utilizado para la algoritmia y generación de gráficas (PDFs y CDFs).
* **MATLAB Live Scripts (`.mlx`):** Utilizados para la integración de código, resultados y narrativa técnica (`Proyecto_Final.mlx`)[cite: 8].
* **Archivos `.mux`:** Modelos y funciones para la generación del escenario y el canal (`generar_canal.mux`, `generar_escenario.mux`, etc.)[cite: 8].

##  Cómo ejecutar el proyecto

1. Clona el repositorio:
   ```bash
   git clone [https://github.com/nmisu/Simulacion-LTE-MIMO-MATLAB.git](https://github.com/nmisu/Simulacion-LTE-MIMO-MATLAB.git)
