<%
Function GETHTTPXML(adres, strMesaj)
    Set StrHTTP = Server.CreateObject("MSXML2.XMLHTTP")
        StrHTTP.Open "POST" , adres, false
        StrHTTP.setRequestHeader "Content-type:","text/xml"
        StrHTTP.sEnd strMesaj
        GETHTTPXML = StrHTTP.Responsetext
    Set StrHTTP = Nothing
End Function

cevap=""

xml="<request>" & _
"<authentication>" & _
"    <username></username>" & _
"    <password></password>" & _
"</authentication>" & _
"<order>" & _
"        <sender></sender>" & _
"        <sendDateTime></sendDateTime>" & _
"            <message>" & _
"                <text><![CDATA[…]]></text>" & _
"                <receipents>" & _
"                    <number></number>" & _
"                </receipents>" & _
"            </message>" & _
"    </order>" & _
"</request>"
cevap=GETHTTPXML("http://api.iletimerkezi.com/v1/send-sms 
",xml)
response.write cevap
%>