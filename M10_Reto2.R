##### M10 Reto 2

# Cargar "Maestro de Clientes.csv"
maestro_clientes <- read.csv("Maestro de Clientes.csv", sep = ";", stringsAsFactors = FALSE)

# Cargar "Maestro Tiquets Cliente.csv"
maestro_tiquets <- read.csv("Maestro Tiquets Cliente.csv", sep = ";", stringsAsFactors = FALSE)

# Lista de variables del archivo "Maestro de Clientes"
names(maestro_clientes)

# Lista de variables del archivo "Maestro Tiquets Cliente"
names(maestro_tiquets)


# Overview de las BBDD
str(maestro_clientes)
str(maestro_tiquets)

# Análisis de rangos para el data frame "maestro_clientes" & filtraje donde sea pertinente (edades y fechas captacionCRM)

cat("Id_cliente (número de clientes únicos):", length(unique(maestro_clientes$Id_cliente)), "\n")
cat("Pais (valores únicos):", paste(unique(maestro_clientes$Pais), collapse = ", "), "\n")
clientes_por_pais <- table(maestro_clientes$Pais) # Contar el número de clientes por país
print(clientes_por_pais) # casi todos en España
maestro_clientes$Fecha_CaptacionCRM <- as.Date(maestro_clientes$Fecha_CaptacionCRM, format = "%d/%m/%Y")
maestro_clientes <- maestro_clientes[maestro_clientes$Fecha_CaptacionCRM >= as.Date("2021-01-01"), ] #Filtramos datos para conservar fechas posteriores a Enero 2021
cat("Rango de Fechas_CaptacionCRM:", format(min(maestro_clientes$Fecha_CaptacionCRM, na.rm = TRUE), "%d/%m/%Y"), 
    "a", format(max(maestro_clientes$Fecha_CaptacionCRM, na.rm = TRUE), "%d/%m/%Y"), "\n")
cat("Tienda_CaptacionCRM (valores únicos):", paste(unique(maestro_clientes$Tienda_CaptacionCRM), collapse = ", "), "\n")
cat("Genero (valores únicos):", paste(unique(maestro_clientes$Genero), collapse = ", "), "\n")
maestro_clientes <- maestro_clientes[maestro_clientes$Edad_actual >= 15 & maestro_clientes$Edad_actual <= 90, ] #Filtrar los datos para conservar solo las edades entre 0 y 100 años
cat("Rango de Edad_actual:", min(maestro_clientes$Edad_actual, na.rm = TRUE), "a", max(maestro_clientes$Edad_actual, na.rm = TRUE), "\n")


# Análisis de rangos para el data frame "maestro_tiquets"

cat("Id_cliente (número de clientes únicos):", length(unique(maestro_tiquets$Id_cliente)), "\n")
cat("Origen_tiquet (valores únicos):", paste(unique(maestro_tiquets$Origen_tiquet), collapse = ", "), "\n")
cat("Rango de Fecha_tiquet:", min(maestro_tiquets$Fecha_tiquet, na.rm = TRUE), "a", max(maestro_tiquets$Fecha_tiquet, na.rm = TRUE), "\n")
maestro_tiquets$Importe_tiquet <- as.numeric(gsub(",", ".", maestro_tiquets$Importe_tiquet))
cat("Rango de Importe_tiquet:", min(maestro_tiquets$Importe_tiquet, na.rm = TRUE), "a", max(maestro_tiquets$Importe_tiquet, na.rm = TRUE), "\n")
cat("Rango de Articulos_tiquet:", min(maestro_tiquets$Articulos_tiquet, na.rm = TRUE), "a", max(maestro_tiquets$Articulos_tiquet, na.rm = TRUE), "\n")




### EN GENERAL A APLICAR DONDE CREAMOS CONVENIENTE --> Segmentaciones relevantes por edad, genero, pais, tipo de tienda



# 1) Tipos de clientes
  
  # 1.1) Clientes Activos (numeros absolutos y %)
  # 1.2) Clientes "zombis" (numeros absolutos y %)
  # 1.3) Evolutivo de clientes captados

maestro_clientes$Ano_Captacion <- format(maestro_clientes$Fecha_CaptacionCRM, "%Y") # Extraer el año de la variable 'Fecha_CaptacionCRM'
clientes_por_ano <- table(maestro_clientes$Ano_Captacion) # Contar el número de clientes por año de captación
print(clientes_por_ano)


  

# 2) Promedio de compras (anual, mensual)

# 3) Flujo de visitas

  # 3.1) Total visitas
  # 3.2) Total compradores
  # 3.3) Tasa conversion
  # 3.4) Total ventas
    # 3.4.1) Total ventas (numero de articulos)
    # 3.4.2) Total ventas (euros)
  # 3.5) Total devoluciones


# 4) Compradores de la semana/dia

  # 4.1) Compradores del CRM vs visitantes (no si es poible con esta BBDD??)
  # 4.2) Compradores compulsivos
  # 4.3) Compradores que siguen patrones/frecuencias - ventas reiterativas

# 5) Tiquet Medio

# 6) Unidades por Tiquet (UPT)

