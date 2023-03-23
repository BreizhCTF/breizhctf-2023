import qrcode
img = qrcode.make('/poke_hidden_form.html')
pixels = list(img.getdata())
width, height = img.size

data = "<table>"
for y in range(0, height, 10):
    data += "<tr>"
    for x in range(0, width, 10):
        p = pixels[y*width+x]
        if p == 0:
            data += "<td class='black'></td>"
        else:
            data += "<td class='white'></td>"
    data += "</tr>\n"
data += "</table>"
print(data)