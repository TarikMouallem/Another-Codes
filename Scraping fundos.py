from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from datetime import date

#configurações do navegador
options = webdriver.ChromeOptions()
options.add_argument("headless")
options.add_argument("window-size=1920x1080")
driver = webdriver.Chrome(chrome_options=options)

#Funcão para a variação anual. Fonte: maisretorno.com
def var_ano(my_url):
    driver.get(my_url)
    #Tempo de espera para carregar totalmente a página
    driver.implicitly_wait(20)
    ano = driver.find_element_by_xpath("/html/body/mr-app-root/mr-sheet-page/div/mr-tabs/mr-tab[1]/div/div[2]/mr-profitability-grid/div/div[5]/div[2]/table/tbody/tr[1]/td[1]").text
    return ano

#Função para a variação diária. Fonte: data.anbima.com.br
def var_dia(my_url):
    driver.get(my_url)
    #Tempo de espera para carregar totalmente a página
    driver.implicitly_wait(20)
    ans1 = driver.find_element_by_xpath("//*[@id=\"periodicosValorDaCota-0\"]").text
    ans2 = driver.find_element_by_xpath("//*[@id=\"periodicosValorDaCota-1\"]").text
    ansf1 = float(ans1.replace('.','').replace(',',''))
    ansf2 = float(ans2.replace('.','').replace(',',''))
    dia = ((ansf1/ansf2)-1.0)*100.0
    dia = str(round(dia,2)) + "%"
    return dia

#Função de espaçamento
def space(x):
    texto=""
    for i in range(0,x):
        texto+=" "
    return texto


fundo = ["Constellation Ações FIC FIA","Squadra Long-Only FIC FIA","Bogari Value FIC FIA","Núcleo Ações FIC FIA","Dynamo Cougar" ]
ano = []
dia = []

#Constellation Ações FIC FIA 
ano.append(var_ano("https://maisretorno.com/fundo/constellation-acoes-ppc-fic-fia"))
dia.append(var_dia("https://data.anbima.com.br/fundos/250759#rentabilidade"))

#Squadra Long-Only FIC FIA
ano.append(var_ano("https://maisretorno.com/fundo/squadra-long-only-fic-fia"))
dia.append(var_dia("https://data.anbima.com.br/fundos/206881#rentabilidade"))

#Bogari Value FIC FIA
ano.append(var_ano("https://maisretorno.com/fundo/bogari-value-fic-fia"))
dia.append(var_dia("https://data.anbima.com.br/fundos/212962#rentabilidade"))

#Núcleo Ações FIC FIA 
ano.append(var_ano("https://maisretorno.com/fundo/nucleo-acoes-fic-fia"))
dia.append(var_dia("https://data.anbima.com.br/fundos/296899#rentabilidade"))

#Dynamo Cougar
ano.append(var_ano("https://maisretorno.com/fundo/dynamo-cougar-fia"))
dia.append(var_dia("https://data.anbima.com.br/fundos/010431#dadosCadastrais"))

#Salvar informações em txt
arquivo = open(r"C:\Users\tarik\OneDrive\Área de Trabalho\Códigos\case_brasil_capital.txt", "w")
sz_max = len(fundo[0])
texto = "Fundo" + space(sz_max-3) + "|   Dia   |  Ano    \n"
for i in range(0,5):
    texto+=fundo[i] + space(sz_max - len(fundo[i])) +'  |  '
    texto+=dia[i] + '  |   '
    texto+= ano[i]  + '\n'

texto+="\nData: " + str(date.today()) +"\n"
arquivo.write(texto)
arquivo.close
