# Exerc�cios.

# 1 - Conforme "#bloco 1", crie um data frame com 7 linhas e 7 colunas chamado df, escolha osn�meros que far�o parte dos dados 
# do data frame usando a fun��o sample. A fun��o sample deve escolher os n�meros que far�o parte do data frame entre os n�meros 
# de 1 a 100 mais os n�meros -9, -99,-999 e -9999. Nomeie as colunas do data frame com letras do alfabeto.

rm(list=ls())
df <- data.frame(replicate(7, sample(c(1:100, -9, -99,-999, -9999), 7, rep = TRUE)))
names(df) <- letters[1:7]
df

# 2 - Nas colunas 3 e 4 do data frame df, caso haja valores negativos, os mesmos devem sersubstitu�dos por NA (not available)

rm(list=ls())
df2 <- data.frame(replicate(7, sample(c(1:100, -9, -99,-999, -9999), 7, rep = TRUE)))
names(df2) <- letters[1:7]
df2

missing_fixer <- function(na_value) {
  return (function(x) {   
    x[x == na_value] <- NA    
    x  
  })
}

colunasAlterar <- c(3:4)

for (f in c(missing_fixer(-9), missing_fixer(-99),missing_fixer(-999),missing_fixer(-9999))){  
  df2[, colunasAlterar] <- lapply(df2[,colunasAlterar],f)
}

df2