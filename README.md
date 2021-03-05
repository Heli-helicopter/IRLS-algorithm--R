# IRLS-algorithm--R
Example of an Iteratively re-weighted least squares algorithm.

Data is the number of aids cases per quater in Australia from the 1st quater of 1984 to the 4th quater of 1988. The number of cases is the responses variable and the time period (quater) is the predictor. As the data is Poisson, the log link function will be used.

![alt text](https://github.com/Heli-helicopter/IRLS-algorithm--R/blob/main/Scattter.png)


![alt text](https://github.com/Heli-helicopter/IRLS-algorithm--R/blob/main/glm_output.PNG)

The IRLS algorithm produced B1 = 0.995998 B2 = 1.326610. These match the coefficients produced by the glm function.
