
# Projeto-HR-VisualizacaoDados-T1


```
# Análise de Dados de RH — Salários, Cargos e Distribuição Regional

## Aluna / Turma
 Adriana Silva Dias de Souza -
 Curso: Visualização de Dados e Business Intelligence
 Turma: QA VDBI 2026/1 2

## Objetivo do trabalho

Este projeto final tem como objetivo explorar e identificar a distribuição de salários dos colaboradores por cargo e por região da empresa, atuando como analista de dados sobre o esquema HR do banco FreeSQL, para apoiar decisões de gestão de Recursos Humanos.

## Tabelas utilizadas

- **HR.EMPLOYEES**: colunas usadas foram `FIRST_NAME` e `SALARY`. Conexão com `HR.DEPARTMENTS` pela coluna `DEPARTMENT_ID`.
- **HR.DEPARTMENTS**: colunas usadas foram `DEPARTMENT_NAME` e `DEPARTMENT_ID`. Conexão com `HR.LOCATIONS` pela coluna `LOCATION_ID`.
- **HR.JOBS**: coluna usada foi `JOB_TITLE`. Conexão com `HR.EMPLOYEES` pela coluna `JOB_ID`.
- **HR.LOCATIONS**: colunas usadas foram `LOCATION_ID` e `CITY`. Conexão com `HR.COUNTRIES` pela coluna `COUNTRY_ID`.
- **HR.COUNTRIES**: coluna usada foi `COUNTRY_NAME`. Conexão com `HR.LOCATIONS` pela coluna `COUNTRY_ID` e com `HR.REGIONS` pela coluna `REGION_ID`.
- **HR.REGIONS**: coluna usada foi `REGION_NAME`. Conexão com `HR.COUNTRIES` pela coluna `REGION_ID`.

## Consultas SQL

### Query 1 — Salário por Departamento e Cargo
Objetivo: analisar a distribuição de salários por departamento e cargo.
Tabelas: EMPLOYEES, DEPARTMENTS, JOBS (LEFT JOIN)
Filtro: `WHERE salary IS NOT NULL`
Conexões:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
- EMPLOYEES.JOB_ID = JOBS.JOB_ID

### Query 2 — Funcionários por Região
Objetivo: analisar a distribuição geográfica dos funcionários.
Tabelas: EMPLOYEES, DEPARTMENTS, LOCATIONS, COUNTRIES, REGIONS (LEFT JOIN)
Filtro: `WHERE region_name IS NOT NULL`
Conexões:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
- DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
- LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID
- COUNTRIES.REGION_ID = REGIONS.REGION_ID

Os scripts completos estão salvos nos arquivos `query_01.sql` e `query_02.sql.

## Análise em Python (EDA)

Os dados das duas queries foram exportados como `query_01.csv` e `query_02.csv`, e importados no Python com a biblioteca `pandas` para a Análise Exploratória de Dados (EDA).

Etapas realizadas:
- Conferência inicial dos dados com `.head()`, `.info()` e `.dtypes`
- Verificação de valores nulos com `.isnull().sum()`: foi encontrado 1 valor nulo na coluna `DEPARTMENT_NAME` (na Query 1). Na Query 2, todos os dados estavam completos.
- Verificação de duplicatas com `.duplicated().sum()`: não foram encontrados dados duplicados.
- Estatísticas descritivas com `.describe()` na coluna de salário (107 registros):
  - Média: **6461,83**
  - Mediana: **6200,00**
  - Mínimo: **2100,00**
  - Máximo: **24000,00**
  - Desvio padrão: 3909,58
  - 1º quartil (25%): 3100,00
  - 3º quartil (75%): 8900,00

## Gráfico

Foi criado um **boxplot** de salário por departamento (arquivo `boxplot_salario_departamento.png`), escolhido por permitir comparar vários departamentos ao mesmo tempo e identificar outliers (salários fora do padrão) com mais facilidade do que um histograma.

## Principais resultados / Insights

- A média salarial da empresa é de 6461,83, e a mediana é 6200,00 — valores próximos, sugerindo uma distribuição relativamente equilibrada, sem uma concentração extrema de valores muito altos puxando a média para cima.
- Os departamentos de **Shipping** e **Sales** concentram o maior número de funcionários e também a maior variação salarial entre eles, indicando que merecem atenção especial do RH.
- Departamentos como **Purchasing**, **Finance** e **IT** também apresentam diferenças salariais internas, porém com menos funcionários envolvidos.
- Recomendação ao RH: investigar as causas dessas diferenças salariais dentro de um mesmo departamento — por exemplo, benefícios individuais (como triênios ou ajustes de custo de vida), diferenças na rotina de trabalho, ou tempo de empresa.
- Na análise geográfica, a região da **Europa** concentra 36 funcionários, sendo 34 em Oxford (Reino Unido), 1 em Munique (Alemanha) e 1 em Londres (Reino Unido).
- Na região das **Américas**, os 69 funcionários se distribuem entre Seattle (18), South San Francisco (45), Southlake (4) — todos nos EUA — e Toronto (2, Canadá).
- Durante a análise, também foram feitas consultas exploratórias extras (salário por cidade, e tentativa de relacionar com histórico de cargos) para investigar possíveis causas das diferenças salariais — esse processo de investigação está detalhado no vídeo de apresentação.

## Como executar o projeto
1. Clonar este repositório: `git clone https://github.com/Adri1992ana/Projeto-HR-VisualizacaoDados-T1.git`
2. Ter uma conta no [Oracle FreeSQL](https://apex.oracle.com/database/freesql/) com acesso ao schema HR (ou usar diretamente os arquivos `query_01.csv` e `query_02.csv` já incluídos no repositório)
3. Instalar as bibliotecas necessárias: `pip install pandas matplotlib`
4. Executar o arquivo `analise.py` para gerar a EDA e o gráfico

## Sugestões de melhoria futuras
- Criar também um histograma da distribuição geral de salários, além do boxplot por departamento
- Aprofundar a investigação das causas das diferenças salariais dentro dos departamentos (ex: cruzar com tempo de empresa de forma mais estruturada)
- Criar um boxplot comparando salários por região, além de por departamento.
```
