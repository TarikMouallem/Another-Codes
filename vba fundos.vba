Sub codigo()
 
    Cells(5, 1) = "Atualizando..."
    'constellation
    Dim ie_constellation As Object
    Set ie_constellation = CreateObject("internetexplorer.application")
    ie_constellation.navigate ("https://constellation.com.br/pra-voce/#performance")
    'ie_constellation.Visible = True
 
    Do While ie_constellation.busy And ie_constellation.readyState <> "READYSTATE_COMPLETE"
        DoEvents
    Loop
    i = 1
    Do While i < 5000000
        i = i + 1
    Loop
 
    constellation_dia = ie_constellation.document.getElementsByClassName("const-table const-table--plus-columns")(0).getElementsByTagName("td")(4).innerText
    constellation_ano = ie_constellation.document.getElementsByClassName("const-table const-table--plus-columns")(0).getElementsByTagName("td")(6).innerText
 
    ie_constellation.Quit
    Set ie_constellation = Nothing
 
    'squadra
    Dim ie_squadra As Object
    Set ie_squadra = CreateObject("internetexplorer.application")
    ie_squadra.navigate ("http://www.squadrainvestimentos.com/default.aspx")
    'ie_squadra.Visible = True
 
    Do While ie_squadra.busy And ie_squadra.readyState <> "READYSTATE_COMPLETE"
        DoEvents
    Loop
    i = 1
    Do While i < 5000000
        i = i + 1
    Loop
 
    squadra_dia = ie_squadra.document.getElementsByTagName("td")(20).innerText
    squadra_ano = ie_squadra.document.getElementsByTagName("td")(22).innerText
 
    ie_squadra.Quit
    Set ie_squadra = Nothing
 
    'bogari
    Dim ie_bogari As Object
    Set ie_bogari = CreateObject("internetexplorer.application")
    ie_bogari.navigate ("http://bogaricapital.com.br/")
    'ie_bogari.Visible = True
 
    Do While ie_bogari.busy And ie_bogari.readyState <> "READYSTATE_COMPLETE"
        DoEvents
    Loop
    i = 1
    Do While i < 5000000
        i = i + 1
    Loop
 
    bogari_dia = ie_bogari.document.getElementsByTagName("td")(2).innerText
    bogari_ano = ie_bogari.document.getElementsByTagName("td")(3).innerText
 
 
    ie_bogari.Quit
    Set ie_bogari = Nothing
 
 
    'nucleo
    Dim ie_nucleo As Object
    Set ie_nucleo = CreateObject("internetexplorer.application")
    ie_nucleo.navigate ("https://www.nucleocapital.com.br/")
    'ie_nucleo.Visible = True
    Do While ie_nucleo.busy And ie_nucleo.readyState <> "READYSTATE_COMPLETE"
        DoEvents
    Loop
    i = 1
    Do While i < 5000000
        i = i + 1
    Loop
 
    nucleo_dia = ie_nucleo.document.getElementsByTagName("td")(2).innerText
    nucleo_ano = ie_nucleo.document.getElementsByTagName("td")(5).innerText
 
    ie_nucleo.Quit
    Set ie_nucleo = Nothing
 
    'dynamo
    Dim ie_dynamo As Object
    Set ie_dynamo = CreateObject("internetexplorer.application")
    ie_dynamo.navigate ("https://www.dynamo.com.br/pt")
    'ie_dynamo.Visible = True
 
    Do While ie_dynamo.busy And ie_dynamo.readyState <> "READYSTATE_COMPLETE"
        DoEvents
    Loop
    i = 1
    Do While i < 5000000
        i = i + 1
    Loop
 
    dynamo_dia = ie_dynamo.document.getElementsByTagName("td")(18).innerText
    dynamo_ano = ie_dynamo.document.getElementsByTagName("td")(21).innerText
 
 
    ie_dynamo.Quit
    Set ie_dynamo = Nothing
 
    'Colar dados
 
    Cells(3, 6) = constellation_dia
    Cells(3, 7) = constellation_ano
    Cells(7, 6) = squadra_dia
    Cells(7, 7) = squadra_ano
    Cells(11, 6) = bogari_dia
    Cells(11, 7) = bogari_ano
    Cells(15, 6) = nucleo_dia
    Cells(15, 7) = nucleo_ano
    Cells(19, 6) = dynamo_dia
    Cells(19, 7) = dynamo_ano
    Cells(5, 1) = "Atualizado!"
 
 
End Sub
