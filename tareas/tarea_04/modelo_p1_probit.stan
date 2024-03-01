data {
  int<lower=0> k; // observaciones
  array[k] int<lower=0> n; // expuestos
  array[k] int<lower=0> y; // muertos
  array[k] real w; // dosis
}

transformed data {
  real w_mean = mean(w); // promedio de w para centrar
}

parameters {
  real alpha;
  real beta;
}

transformed parameters {
  array[k] real p; // probability of success

  for (i in 1:k) {
    p[i] = Phi_approx(alpha + beta * (w[i] - w_mean)); // probit 
  }
}

model {
  alpha ~ normal(0, 1000); // inicial de alfa
  beta ~ normal(0, 1000); // inicial de beta

  for (i in 1:k) {
    y[i] ~ binomial(n[i], p[i]);
  }
}
