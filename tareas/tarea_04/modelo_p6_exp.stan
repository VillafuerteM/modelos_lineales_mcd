// Modelo exponencial
data {
  int<lower=0> N;       // Número de observaciones
  vector[N] y;           // Observaciones
  real<lower=0> theta0;  // Valor inicial para theta
}

parameters {
  real<lower=0> theta;  // Parámetro de la distribución exponencial
}

model {
  theta ~ exponential(1 / theta0);  // Prior para theta
  y ~ exponential(theta);           // Likelihood de las observaciones
}
