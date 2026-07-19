# 1 Importando bibliotecas necessárias --

import pandas as pd
import matplotlib.pyplot as plt

# 2 Defininido nomes dos DataFrames e carregando os dados das consultas SQL --

df_cargo_salario = pd.read_csv("query_01.csv")
df_regiao_salario = pd.read_csv("query_02.csv")

print(df_cargo_salario.head())
print(df_regiao_salario.head())

# Primeiro print para verificar se os dados foram carregados corretamente. O terminal exibiu 
# as primeiras 5 linhas de cada DataFrame, confirmando que os dados foram importados com sucesso.

print(df_regiao_salario.info())
print(df_cargo_salario.info())

print(df_cargo_salario.dtypes)
print(df_regiao_salario.shape[0])

# 3 Estatisticas descritivas dos salários por cargo --
# A mediana de salários é  6200.000000.

print(df_cargo_salario.describe())
print(df_regiao_salario.describe())

# Verificando valores nulos nos DataFrames --

print(df_cargo_salario.isnull().sum())
print(df_regiao_salario.isnull().sum())


# 4 Verificando duplicatas nos DataFrames --

print(df_cargo_salario.duplicated().sum())
print(df_regiao_salario.duplicated().sum())

# 5 Criando gráficos para visualizar a distribuição dos salários por cargo e por região --
 # Conferindo os nomes das colunas dos DataFrames para garantir que estão corretos antes de criar os gráficos.

# print(df_cargo_salario.columns)

grupos = df_cargo_salario.groupby('DEPARTMENT_NAME')['SALARY'].apply(list)

plt.boxplot(grupos, tick_labels=grupos.index)
plt.xticks(rotation=45)
plt.title('Distribuição de Salário por Departamento')
plt.xlabel('Departamento')
plt.ylabel('Salário')
plt.savefig('boxplot_salario_departamento.png')
plt.show()

