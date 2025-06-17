import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15

Rectangle {
    id: ticket_Page_Owner
    width: 1440
    height: 1024
    color: "#f2efea"
    border.color: "#000000"
    border.width: 1
    property alias p100Text: p100.text
    property alias element1Text: element1.text
    property alias cafe_LatteText: cafe_Latte.text
    property alias foodText: food.text
    property alias non_CoffeeText: non_Coffee.text
    property alias gCashText: gCash.text
    property alias caramel_McchiatoText: caramel_Mcchiato.text
    property alias mKText: mK.text
    property alias receiptsText: receipts.text
    property alias inventoryText: inventory.text
    property alias changeText: change.text
    property alias discountText: discount.text
    property alias product_Name1Text: product_Name1.text
    property alias subTotalText: subTotal.text
    property alias cash_BoxText: cash_Box.text
    property alias change1Text: change1.text
    property alias hello_UserText: hello_User.text
    property alias allText: all.text
    property alias logsText: logs.text
    property alias dash_boardText: dash_board.text
    property alias product_NameText: product_Name.text
    property alias cappuccinoText: cappuccino.text
    property alias element6Text: element6.text
    property alias chargeText: charge.text
    property alias mayaText: maya.text
    property alias p20Text: p20.text
    property alias coffeeText: coffee.text
    property alias elementText: element.text
    property alias element2Text: element2.text
    property alias size_Infos_Quantity_Text: size_Infos_Quantity_.text
    property alias mochaText: mocha.text
    property alias clearText: clear.text
    property alias p1000Text: p1000.text
    property alias p500Text: p500.text
    property alias staffText: staff.text
    property alias ticketText: ticket.text
    property alias ticket1Text: ticket1.text
    property alias americanoText: americano.text
    property alias p200Text: p200.text
    property alias splitText: split.text
    property alias element3Text: element3.text
    property alias size_Infos_Quantity_1Text: size_Infos_Quantity_1.text
    property alias cash_ReceivedText: cash_Received.text
    property alias element4Text: element4.text
    property alias p50Text: p50.text

    Item {
        id: group_13
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 944
        Image {
            id: rectangle_4
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -12
            anchors.topMargin: -8
            source: "assets/rectangle_4_1.png"
        }

        Item {
            id: group_2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 120
            anchors.bottomMargin: 793
            Image {
                id: rectangle_8
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -8
                anchors.topMargin: -4
                source: "assets/rectangle_8_1.png"
            }

            Text {
                id: product_Name
                width: 192
                height: 21
                color: "#4e2d18"
                text: qsTr("Product Name")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 15
                anchors.topMargin: 20
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: size_Infos_Quantity_
                width: 153
                height: 24
                color: "#4e2d18"
                text: qsTr("Size: \nInfos:\nQuantity:")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 15
                anchors.topMargin: 47
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.ExtraLight
                font.family: "Unbounded"
            }

            Text {
                id: element
                width: 102
                height: 28
                color: "#708a2e"
                text: qsTr("₱130")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 355
                anchors.topMargin: 74
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
        }

        Image {
            id: rectangle_16
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -3
            anchors.topMargin: 661
            source: "assets/rectangle_16_1.png"
        }

        Text {
            id: discount
            width: 77
            height: 17
            color: "#4e2d18"
            text: qsTr("Discount")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 299
            anchors.topMargin: 684
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Item {
            id: group_3
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 254
            anchors.bottomMargin: 659
            Image {
                id: rectangle_9
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: -8
                anchors.topMargin: -4
                source: "assets/rectangle_9_1.png"
            }

            Text {
                id: product_Name1
                width: 192
                height: 21
                color: "#4e2d18"
                text: qsTr("Product Name")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 15
                anchors.topMargin: 20
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Text {
                id: size_Infos_Quantity_1
                width: 153
                height: 24
                color: "#4e2d18"
                text: qsTr("Size: \nInfos:\nQuantity:")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 15
                anchors.topMargin: 47
                font.pixelSize: 12
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.ExtraLight
                font.family: "Unbounded"
            }

            Text {
                id: element1
                width: 102
                height: 28
                color: "#708a2e"
                text: qsTr("₱130")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 355
                anchors.topMargin: 74
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.DemiBold
                font.family: "Unbounded"
            }
        }

        Text {
            id: subTotal
            width: 166
            height: 16
            color: "#4e2d18"
            text: qsTr("SubTotal")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 34
            anchors.topMargin: 609
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Text {
            id: element2
            width: 149
            height: 16
            color: "#4d6443"
            text: qsTr("₱ 145.00")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 317
            anchors.topMargin: 605
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Shape {
            id: line_2_Stroke_
            width: 442
            height: 3
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 26
            anchors.topMargin: 580
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_2_Stroke__ShapePath_0
                strokeWidth: 2
                strokeColor: "transparent"
                PathSvg {
                    id: line_2_Stroke__PathSvg_0
                    path: "M 2.0133087635040283 0.004544760100543499 L 2.0087838172912598 2.004539728164673 L 0 1.9999948740005493 L 0.004524875432252884 0 L 2.0133087635040283 0.004544760100543499 Z M 10.050397872924805 0.022728219628334045 L 10.045872688293457 2.0227231979370117 L 6.0273284912109375 2.0136313438415527 L 6.031853199005127 0.013636489398777485 L 10.050397872924805 0.022728219628334045 Z M 18.086509704589844 0.04090946912765503 L 18.081985473632812 2.0409042835235596 L 14.063440322875977 2.0318126678466797 L 14.067965507507324 0.031817737966775894 L 18.086509704589844 0.04090946912765503 Z M 26.122621536254883 0.05909071862697601 L 26.11809730529785 2.0590856075286865 L 22.099552154541016 2.0499937534332275 L 22.10407829284668 0.049998991191387177 L 26.122621536254883 0.05909071862697601 Z M 34.15873336791992 0.077271968126297 L 34.15420913696289 2.0772669315338135 L 30.136642456054688 2.0681772232055664 L 30.14116668701172 0.06818244606256485 L 34.15873336791992 0.077271968126297 Z M 42.195823669433594 0.09545543044805527 L 42.19129943847656 2.0954504013061523 L 38.172752380371094 2.0863585472106934 L 38.17728042602539 0.08636369556188583 L 42.195823669433594 0.09545543044805527 Z M 50.23193359375 0.11363667994737625 L 50.22740936279297 2.1136314868927 L 46.208866119384766 2.1045398712158203 L 46.2133903503418 0.10454495251178741 L 50.23193359375 0.11363667994737625 Z M 58.26804733276367 0.13181792199611664 L 58.26352310180664 2.131812810897827 L 54.24497985839844 2.122720956802368 L 54.24950408935547 0.1227262020111084 L 58.26804733276367 0.13181792199611664 Z M 66.30416107177734 0.14999917149543762 L 66.29963684082031 2.149994134902954 L 62.282066345214844 2.140904426574707 L 62.286590576171875 0.14090965688228607 L 66.30416107177734 0.14999917149543762 Z M 74.34124755859375 0.1681826412677765 L 74.33672332763672 2.168177604675293 L 70.31817626953125 2.159085750579834 L 70.32270050048828 0.15909090638160706 L 74.34124755859375 0.1681826412677765 Z M 82.37735748291016 0.18636389076709747 L 82.37283325195312 2.186358690261841 L 78.35429382324219 2.177267074584961 L 78.35881805419922 0.17727215588092804 L 82.37735748291016 0.18636389076709747 Z M 90.4134750366211 0.20454514026641846 L 90.40895080566406 2.2045400142669678 L 86.3904037475586 2.195448398590088 L 86.39492797851562 0.19545340538024902 L 90.4134750366211 0.20454514026641846 Z M 98.4495849609375 0.22272638976573944 L 98.44506072998047 2.2227213382720947 L 94.427490234375 2.2136316299438477 L 94.43201446533203 0.2136368602514267 L 98.4495849609375 0.22272638976573944 Z M 106.4866714477539 0.24090984463691711 L 106.48214721679688 2.2409048080444336 L 102.46360778808594 2.2318129539489746 L 102.46813201904297 0.23181812465190887 L 106.4866714477539 0.24090984463691711 Z M 114.52278900146484 0.2590911090373993 L 114.51826477050781 2.2590858936309814 L 110.49971771240234 2.2499942779541016 L 110.50424194335938 0.24999937415122986 L 114.52278900146484 0.2590911090373993 Z M 122.55889892578125 0.2772723436355591 L 122.55437469482422 2.2772672176361084 L 118.53582763671875 2.2681756019592285 L 118.54035186767578 0.26818060874938965 L 122.55889892578125 0.2772723436355591 Z M 130.5950164794922 0.29545360803604126 L 130.59048461914062 2.2954485416412354 L 126.57291412353516 2.2863588333129883 L 126.57744598388672 0.2863640785217285 L 130.5950164794922 0.29545360803604126 Z M 138.63209533691406 0.31363704800605774 L 138.62757873535156 2.313632011413574 L 134.60902404785156 2.3045401573181152 L 134.61355590820312 0.3045453131198883 L 138.63209533691406 0.31363704800605774 Z M 146.668212890625 0.3318183124065399 L 146.66368103027344 2.331813097000122 L 142.6451416015625 2.322721481323242 L 142.64967346191406 0.3227265775203705 L 146.668212890625 0.3318183124065399 Z M 154.70433044433594 0.3499995470046997 L 154.69979858398438 2.349994421005249 L 150.68125915527344 2.340902805328369 L 150.68577575683594 0.3409078121185303 L 154.70433044433594 0.3499995470046997 Z M 162.7404327392578 0.3681808114051819 L 162.7359161376953 2.368175745010376 L 158.7183380126953 2.359086275100708 L 158.72286987304688 0.35909128189086914 L 162.7404327392578 0.3681808114051819 Z M 170.77752685546875 0.38636425137519836 L 170.7729949951172 2.386359214782715 L 166.75445556640625 2.377267360687256 L 166.7589874267578 0.3772725462913513 L 170.77752685546875 0.38636425137519836 Z M 178.8136444091797 0.40454551577568054 L 178.80911254882812 2.4045403003692627 L 174.7905731201172 2.395448684692383 L 174.7950897216797 0.3954537808895111 L 178.8136444091797 0.40454551577568054 Z M 186.84974670410156 0.4227267801761627 L 186.84523010253906 2.4227216243743896 L 182.82667541503906 2.4136300086975098 L 182.83120727539062 0.4136350452899933 L 186.84974670410156 0.4227267801761627 Z M 194.8858642578125 0.4409080147743225 L 194.88133239746094 2.4409029483795166 L 190.86376953125 2.4318134784698486 L 190.8682861328125 0.43181848526000977 L 194.8858642578125 0.4409080147743225 Z M 202.92294311523438 0.4590914845466614 L 202.91842651367188 2.4590864181518555 L 198.89988708496094 2.4499945640563965 L 198.90440368652344 0.44999974966049194 L 202.92294311523438 0.4590914845466614 Z M 210.9590606689453 0.47727271914482117 L 210.9545440673828 2.4772675037384033 L 206.9359893798828 2.4681758880615234 L 206.94052124023438 0.46818098425865173 L 210.9590606689453 0.47727271914482117 Z M 218.99517822265625 0.49545398354530334 L 218.9906463623047 2.4954488277435303 L 214.97308349609375 2.4863593578338623 L 214.97760009765625 0.4863644540309906 L 218.99517822265625 0.49545398354530334 Z M 227.03128051757812 0.5136352181434631 L 227.02676391601562 2.5136301517486572 L 223.0092010498047 2.5045406818389893 L 223.0137176513672 0.5045456886291504 L 227.03128051757812 0.5136352181434631 Z M 235.06837463378906 0.531818687915802 L 235.06385803222656 2.531813621520996 L 231.04530334472656 2.522721767425537 L 231.04983520507812 0.5227269530296326 L 235.06837463378906 0.531818687915802 Z M 243.1044921875 0.5499999523162842 L 243.09996032714844 2.549994707107544 L 239.0814208984375 2.540903091430664 L 239.0859375 0.5409082174301147 L 243.1044921875 0.5499999523162842 Z M 251.14059448242188 0.5681811571121216 L 251.13607788085938 2.568176031112671 L 247.11849975585938 2.559086561203003 L 247.12303161621094 0.5590916872024536 L 251.14059448242188 0.5681811571121216 Z M 259.1767272949219 0.5863624215126038 L 259.17218017578125 2.586357355117798 L 255.1546173095703 2.57726788520813 L 255.15914916992188 0.577272891998291 L 259.1767272949219 0.5863624215126038 Z M 267.21380615234375 0.6045458912849426 L 267.20928955078125 2.6045408248901367 L 263.19073486328125 2.5954489707946777 L 263.19525146484375 0.5954541563987732 L 267.21380615234375 0.6045458912849426 Z M 275.2499084472656 0.6227271556854248 L 275.2453918457031 2.6227219104766846 L 271.2268371582031 2.6136302947998047 L 271.2313537597656 0.6136354207992554 L 275.2499084472656 0.6227271556854248 Z M 283.2860107421875 0.640908420085907 L 283.281494140625 2.6409032344818115 L 279.2639465332031 2.6318137645721436 L 279.2684631347656 0.6318188905715942 L 283.2860107421875 0.640908420085907 Z M 291.3221435546875 0.6590896248817444 L 291.317626953125 2.6590845584869385 L 287.300048828125 2.6499950885772705 L 287.3045654296875 0.6500000953674316 L 291.3221435546875 0.6590896248817444 Z M 299.3592224121094 0.6772730946540833 L 299.3547058105469 2.6772680282592773 L 295.3361511230469 2.6681761741638184 L 295.3406677246094 0.6681813597679138 L 299.3592224121094 0.6772730946540833 Z M 307.39532470703125 0.6954543590545654 L 307.39080810546875 2.695449113845825 L 303.3722839355469 2.6863574981689453 L 303.3768005371094 0.686362624168396 L 307.39532470703125 0.6954543590545654 Z M 315.43145751953125 0.7136356234550476 L 315.42694091796875 2.713630437850952 L 311.40936279296875 2.704540967941284 L 311.41387939453125 0.7045460939407349 L 315.43145751953125 0.7136356234550476 Z M 323.4675598144531 0.731816828250885 L 323.4630432128906 2.731811761856079 L 319.4454650878906 2.722722291946411 L 319.4499816894531 0.722727358341217 L 323.4675598144531 0.731816828250885 Z M 331.504638671875 0.7500002980232239 L 331.5001220703125 2.749995231628418 L 327.4815673828125 2.740903377532959 L 327.4861145019531 0.7409085631370544 L 331.504638671875 0.7500002980232239 Z M 339.540771484375 0.768181562423706 L 339.5362243652344 2.768176317214966 L 335.5177001953125 2.759084701538086 L 335.522216796875 0.7590898275375366 L 339.540771484375 0.768181562423706 Z M 347.5768737792969 0.7863628268241882 L 347.5723571777344 2.7863576412200928 L 343.5538024902344 2.777266025543213 L 343.5583190917969 0.7772710919380188 L 347.5768737792969 0.7863628268241882 Z M 355.61297607421875 0.8045440912246704 L 355.60845947265625 2.8045389652252197 L 351.59088134765625 2.7954494953155518 L 351.5954284667969 0.7954545617103577 L 355.61297607421875 0.8045440912246704 Z M 363.65008544921875 0.8227275013923645 L 363.6455383300781 2.8227224349975586 L 359.62701416015625 2.8136305809020996 L 359.63153076171875 0.8136357665061951 L 363.65008544921875 0.8227275013923645 Z M 371.6861877441406 0.8409087657928467 L 371.6816711425781 2.8409037590026855 L 367.6631164550781 2.8318119049072266 L 367.6676330566406 0.8318170309066772 L 371.6861877441406 0.8409087657928467 Z M 379.7222900390625 0.8590900301933289 L 379.7177734375 2.8590848445892334 L 375.69921875 2.8499932289123535 L 375.7037658691406 0.8499982953071594 L 379.7222900390625 0.8590900301933289 Z M 387.7584228515625 0.877271294593811 L 387.7538757324219 2.8772661685943604 L 383.736328125 2.8681766986846924 L 383.7408447265625 0.8681817650794983 L 387.7584228515625 0.877271294593811 Z M 395.7955017089844 0.8954547047615051 L 395.7909851074219 2.895449638366699 L 391.7724304199219 2.8863577842712402 L 391.7769470214844 0.8863630294799805 L 395.7955017089844 0.8954547047615051 Z M 403.83160400390625 0.9136359691619873 L 403.82708740234375 2.913630962371826 L 399.80853271484375 2.904539108276367 L 399.8130798339844 0.9045442342758179 L 403.83160400390625 0.9136359691619873 Z M 411.86773681640625 0.9318172335624695 L 411.8631896972656 2.931812047958374 L 407.84466552734375 2.922720432281494 L 407.84918212890625 0.9227254986763 L 411.86773681640625 0.9318172335624695 Z M 419.9038391113281 0.9499984979629517 L 419.8993225097656 2.949993371963501 L 415.8817443847656 2.940903902053833 L 415.8862609863281 0.9409089684486389 L 419.9038391113281 0.9499984979629517 Z M 427.94091796875 0.9681819677352905 L 427.9364013671875 2.96817684173584 L 423.9178466796875 2.959084987640381 L 423.9223937988281 0.9590902328491211 L 427.94091796875 0.9681819677352905 Z M 435.97705078125 0.9863631725311279 L 435.9725036621094 2.986358165740967 L 431.9539794921875 2.977266311645508 L 431.95849609375 0.9772714376449585 L 435.97705078125 0.9863631725311279 Z M 442.0043640136719 0.9999997019767761 L 441.9998474121094 2.9999945163726807 L 439.9900817871094 2.9954476356506348 L 439.9945983886719 0.9954527020454407 L 442.0043640136719 0.9999997019767761 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#8b6341"
            }
            antialiasing: true
        }

        Text {
            id: ticket
            width: 93
            height: 30
            color: "#4d2d18"
            text: qsTr("Ticket")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 51
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: change
            width: 67
            height: 17
            color: "#4e2d18"
            text: qsTr("Change")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 128
            anchors.topMargin: 684
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_17
            width: 109
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#f8961e"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 735
        }

        Text {
            id: p20
            width: 47
            height: 20
            color: "#f8961e"
            text: qsTr("P20")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 51
            anchors.topMargin: 746
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_18
            width: 107
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#5c0099"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 258
            anchors.topMargin: 735
        }

        Text {
            id: p100
            width: 57
            height: 20
            color: "#5c0099"
            text: qsTr("P100")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 289
            anchors.topMargin: 746
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_19
            width: 104
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#87a70a"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 374
            anchors.topMargin: 735
        }

        Text {
            id: p200
            width: 68
            height: 20
            color: "#87a70a"
            text: qsTr("P200")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 394
            anchors.topMargin: 746
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_20
            width: 112
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#c30e0e"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 136
            anchors.topMargin: 735
        }

        Text {
            id: p50
            width: 48
            height: 20
            color: "#c30e0e"
            text: qsTr("P50")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 174
            anchors.topMargin: 746
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_21
            width: 109
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#ffd500"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 20
            anchors.topMargin: 790
        }

        Text {
            id: p500
            width: 60
            height: 20
            color: "#ffd500"
            text: qsTr("P500")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 40
            anchors.topMargin: 801
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_23
            width: 104
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#9e2b2b"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 374
            anchors.topMargin: 790
        }

        Text {
            id: clear
            width: 72
            height: 20
            color: "#9e2b2b"
            text: qsTr("Clear")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 402
            anchors.topMargin: 800
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_24
            width: 112
            height: 41
            color: "#f2efea"
            radius: 8
            border.color: "#0091f7"
            border.width: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 136
            anchors.topMargin: 790
        }

        Text {
            id: p1000
            width: 71
            height: 20
            color: "#0091f7"
            text: qsTr("P1000")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 158
            anchors.topMargin: 802
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            rotation: 0.567
            font.weight: Font.Medium
            font.family: "Unbounded"
        }

        Text {
            id: cash_Received
            width: 104
            height: 15
            color: "#4e2d18"
            text: qsTr("Cash Received")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 77
            anchors.topMargin: 869
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Text {
            id: change1
            width: 56
            height: 15
            color: "#4e2d18"
            text: qsTr("Change")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 351
            anchors.topMargin: 869
            font.pixelSize: 12
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Text {
            id: element3
            width: 79
            height: 30
            color: "#4d6443"
            text: qsTr("₱ 145")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 90
            anchors.topMargin: 893
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Text {
            id: element4
            width: 68
            height: 30
            color: "#4d6443"
            text: qsTr("₱ 24")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 345
            anchors.topMargin: 893
            font.pixelSize: 24
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_25
            width: 95
            height: 53
            color: "#0091f7"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 961
        }

        Text {
            id: gCash
            width: 83
            height: 8
            color: "#f2efea"
            text: qsTr("GCash")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 22
            anchors.topMargin: 983
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_26
            width: 76
            height: 53
            color: "#9aca1f"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 119
            anchors.topMargin: 961
        }

        Text {
            id: maya
            width: 83
            height: 8
            color: "#f2efea"
            text: qsTr("Maya")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 116
            anchors.topMargin: 983
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_27
            width: 95
            height: 53
            color: "#708a2e"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 204
            anchors.topMargin: 961
        }

        Text {
            id: split
            width: 83
            height: 8
            color: "#f2efea"
            text: qsTr("Split")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 211
            anchors.topMargin: 983
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
            font.weight: Font.DemiBold
            font.family: "Unbounded"
        }

        Rectangle {
            id: rectangle_28
            width: 167
            height: 53
            color: "#708a2e"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 311
            anchors.topMargin: 961
        }

        Text {
            id: charge
            width: 75
            height: 20
            color: "#f2efea"
            text: qsTr("Charge")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 354
            anchors.topMargin: 977
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.DemiBold
            font.family: "Unbounded"
        }

        Shape {
            id: line_33_Stroke_
            width: 92
            height: 1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 115
            anchors.topMargin: 705
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_33_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_33_Stroke__PathSvg_0
                    path: "M 92 0 L 92 1 L 0 1 L 0 0 L 92 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4e2d18"
            }
            antialiasing: true
        }
    }

    Item {
        id: group_12
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 130
        anchors.rightMargin: 540
        anchors.topMargin: 112
        anchors.bottomMargin: 853
        Image {
            id: rectangle_29
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -4
            anchors.topMargin: -2
            source: "assets/rectangle_29.png"
        }

        Text {
            id: all
            width: 24
            height: 20
            color: "#4e2d18"
            text: qsTr("All")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 59
            anchors.topMargin: 20
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Text {
            id: coffee
            width: 69
            height: 20
            color: "#4e2d18"
            text: qsTr("Coffee")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 126
            anchors.topMargin: 20
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Text {
            id: non_Coffee
            width: 111
            height: 20
            color: "#4e2d18"
            text: qsTr("Non-Coffee")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 237
            anchors.topMargin: 20
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Shape {
            id: line_1_Stroke_
            width: 84
            height: 3
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 117
            anchors.topMargin: 45
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_1_Stroke__ShapePath_0
                strokeWidth: 3
                strokeColor: "transparent"
                PathSvg {
                    id: line_1_Stroke__PathSvg_0
                    path: "M 84 0 L 84 3 L 0 3 L 0 0 L 84 0 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: food
            width: 128
            height: 20
            color: "#4e2d18"
            text: qsTr("Food")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 389
            anchors.topMargin: 20
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }
    }

    Text {
        id: hello_User
        width: 257
        height: 38
        color: "#4e2d18"
        text: qsTr("Hello, User")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 142
        anchors.topMargin: 41
        font.pixelSize: 36
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Item {
        id: group_122
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 129
        anchors.rightMargin: 1137
        anchors.topMargin: 438
        anchors.bottomMargin: 371
        Item {
            id: group_20
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            Rectangle {
                id: rectangle_34
                width: 174
                height: 215
                color: "#ffffff"
                radius: 16
                anchors.left: parent.left
                anchors.top: parent.top
            }
        }

        Item {
            id: group_22
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 13
            anchors.rightMargin: 25
            anchors.topMargin: 172
            anchors.bottomMargin: 22
            Text {
                id: cappuccino
                width: 137
                height: 21
                color: "#4e2d18"
                text: qsTr("Cappuccino")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4e2d18"
                style: Text.Outline
                font.weight: Font.DemiBold
                font.family: "Poppins"
            }
        }

        Image {
            id: iESP_IcedCappuccino
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 13
            anchors.topMargin: 22
            source: "assets/iESP_IcedCappuccino_1.png"
        }
    }

    Item {
        id: group_120
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 524
        anchors.rightMargin: 740
        anchors.topMargin: 200
        anchors.bottomMargin: 609
        Rectangle {
            id: rectangle_32
            width: 176
            height: 215
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Text {
            id: caramel_Mcchiato
            width: 137
            height: 21
            color: "#4e2d18"
            text: qsTr("Caramel Mcchiato")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 16
            anchors.topMargin: 175
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            styleColor: "#4e2d18"
            style: Text.Outline
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Image {
            id: iESP_IcedCaramelMacchiato
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 14
            anchors.topMargin: 24
            source: "assets/iESP_IcedCaramelMacchiato_1.png"
        }
    }

    Item {
        id: group_121
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 722
        anchors.rightMargin: 541
        anchors.topMargin: 200
        anchors.bottomMargin: 609
        Rectangle {
            id: rectangle_33
            width: 177
            height: 215
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Text {
            id: mocha
            width: 137
            height: 21
            color: "#4e2d18"
            text: qsTr("Mocha")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 16
            anchors.topMargin: 175
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            styleColor: "#4e2d18"
            style: Text.Outline
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Image {
            id: iESP_IcedCaffeMocha
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 14
            anchors.topMargin: 23
            source: "assets/iESP_IcedCaffeMocha_1.png"
        }
    }

    Item {
        id: group_119
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 325
        anchors.rightMargin: 938
        anchors.topMargin: 200
        anchors.bottomMargin: 609
        Rectangle {
            id: rectangle_31
            width: 177
            height: 215
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Text {
            id: cafe_Latte
            width: 137
            height: 21
            color: "#4e2d18"
            text: qsTr("Cafe Latte")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 17
            anchors.topMargin: 175
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            styleColor: "#4e2d18"
            style: Text.Outline
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Image {
            id: iESP_IcedCaffeLatte
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 24
            source: "assets/iESP_IcedCaffeLatte_1.png"
        }
    }

    Item {
        id: group_118
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 127
        anchors.rightMargin: 1137
        anchors.topMargin: 200
        anchors.bottomMargin: 609
        Rectangle {
            id: rectangle_30
            width: 176
            height: 215
            color: "#ffffff"
            radius: 16
            anchors.left: parent.left
            anchors.top: parent.top
        }

        Text {
            id: americano
            width: 137
            height: 21
            color: "#4e2d18"
            text: qsTr("Americano")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 175
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            styleColor: "#4e2d18"
            style: Text.Outline
            font.weight: Font.DemiBold
            font.family: "Poppins"
        }

        Image {
            id: americano1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 15
            anchors.topMargin: 24
            source: "assets/americano1_1.png"
        }
    }

    Item {
        id: group_19
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 1338
        Image {
            id: rectangle_14
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_14_4.png"
        }

        Image {
            id: rectangle_44
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: -2
            anchors.topMargin: -8
            source: "assets/rectangle_44_3.png"
        }

        Rectangle {
            id: rectangle_43
            width: 83
            height: 97
            color: "#4d4d2d18"
            radius: 12
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 8
            anchors.topMargin: 561
        }

        Text {
            id: ticket1
            width: 62
            height: 21
            color: "#4d2d18"
            text: qsTr("Ticket")
            anchors.top: parent.top
            anchors.topMargin: 618
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: -2
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: frame_1
            width: 31
            height: 29
            color: "transparent"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 580
            Shopping_cart {
                id: shopping_cart
                width: 31
                height: 29
                anchors.top: parent.top
                state: "size_48"
                clip: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Text {
            id: inventory
            width: 92
            height: 26
            color: "#4d2d18"
            text: qsTr("Inventory")
            anchors.top: parent.top
            anchors.topMargin: 183
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
            anchors.horizontalCenterOffset: 1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Archive {
            id: archive
            width: 29
            height: 30
            anchors.top: parent.top
            anchors.topMargin: 144
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: -1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: dash_board
            width: 103
            height: 34
            color: "#4d2d18"
            text: qsTr("Dash\nboard")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 722
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Bar_chart_2 {
            id: bar_chart_2
            width: 28
            height: 29
            anchors.top: parent.top
            anchors.topMargin: 687
            state: "size_48"
            clip: true
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: logs
            width: 50
            height: 34
            visible: false
            color: "#4e2d18"
            text: qsTr("Logs")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 28
            anchors.topMargin: 287
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Text {
            id: receipts
            width: 85
            height: 20
            color: "#4e2d18"
            text: qsTr("Receipts")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 9
            anchors.topMargin: 395
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        List {
            id: element5
            width: 34
            height: 28
            anchors.top: parent.top
            anchors.topMargin: 362
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: -3
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: cash_Box
            width: 71
            height: 53
            color: "#4e2d18"
            text: qsTr("Cash Box")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 14
            anchors.topMargin: 493
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }

        Dollar_sign {
            id: dollar_sign
            width: 29
            height: 31
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 33
            anchors.topMargin: 456
            state: "size_48"
            clip: true
        }

        Item {
            id: group_8
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 23
            anchors.rightMargin: 21
            anchors.topMargin: 44
            anchors.bottomMargin: 922
            Text {
                id: mK
                width: 59
                height: 58
                color: "#4d2d18"
                text: qsTr("MK")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 28
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                wrapMode: Text.Wrap
                styleColor: "#4d2d18"
                style: Text.Outline
                font.weight: Font.Medium
                font.family: "Unbounded"
            }

            Shape {
                id: line_1_Stroke_1
                width: 52
                height: 2
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 5
                anchors.topMargin: 35
                layer.samples: 16
                layer.enabled: true
                ShapePath {
                    id: line_1_Stroke__ShapePath_1
                    strokeWidth: 2
                    strokeColor: "transparent"
                    PathSvg {
                        id: line_1_Stroke__PathSvg_1
                        path: "M 52 0 L 52 2 L 8.881784197001252e-16 2 L 0 1.4210854715202004e-14 L 52 0 Z"
                    }
                    fillRule: ShapePath.WindingFill
                    fillColor: "#4d2d18"
                }
                antialiasing: true
            }
        }

        User {
            id: user
            width: 33
            height: 31
            anchors.top: parent.top
            anchors.topMargin: 256
            state: "size_48"
            clip: true
            anchors.horizontalCenterOffset: -1
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            id: staff
            width: 50
            height: 34
            color: "#4e2d18"
            text: qsTr("Staff")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 25
            anchors.topMargin: 298
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Light
            font.family: "Unbounded"
        }
    }

    Text {
        id: element6
        width: 34
        height: 20
        color: "#4e2d18"
        text: qsTr("₱")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1193
        anchors.topMargin: 799
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        wrapMode: Text.Wrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    Shape {
        id: line_34_Stroke_
        width: 86
        height: 1
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 1220
        anchors.topMargin: 823
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: line_34_Stroke__ShapePath_0
            strokeWidth: 1
            strokeColor: "transparent"
            PathSvg {
                id: line_34_Stroke__PathSvg_0
                path: "M 86 0 L 86 1 L 0 1 L 0 0 L 86 0 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#4e2d18"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"d8d5c2de-97cc-5d08-ab41-889dd958a776"}D{i:1;uuid:"0be36f22-cd21-53c0-94c0-70802cd9a874"}
D{i:2;uuid:"1a112ed4-9309-5622-a03f-0843d607babc"}D{i:3;uuid:"05c73f6a-ade9-54b2-94eb-4f518769934e"}
D{i:4;uuid:"99252eea-47dc-5f5d-a228-5042d991d1b4"}D{i:5;uuid:"7acff1e9-635d-5150-9914-7c65fd14fa9c"}
D{i:6;uuid:"06554485-86f0-5aa5-826e-7f58eb0ff0a5"}D{i:7;uuid:"df98abde-4494-5c99-b3c8-1f14991b4d8c"}
D{i:8;uuid:"7d5f38a4-01fa-5792-a648-25280c48e527"}D{i:9;uuid:"8b1af69f-de10-57c2-a3ef-9ec53632782b"}
D{i:10;uuid:"19fb4b2a-97f7-51fe-8b61-b633d90432fe"}D{i:11;uuid:"9b408d63-d5ed-52cf-b41c-85e41a8bae79"}
D{i:12;uuid:"079d0c5c-ac5c-5b85-a799-5de055e8d629"}D{i:13;uuid:"c2c4da60-875d-52ed-8d3f-6f66613ea584"}
D{i:14;uuid:"1788986d-67c9-5d9b-a645-21e468eec253"}D{i:15;uuid:"7453eb1c-7e67-5ffa-b180-a48c8c78356a"}
D{i:16;uuid:"05c4e5f1-8288-5001-8e2f-089e0a9f0b0d"}D{i:17;uuid:"9c313e1a-d2e5-5154-96b6-684e7c0b8f23"}
D{i:18;uuid:"9c313e1a-d2e5-5154-96b6-684e7c0b8f23_ShapePath_0"}D{i:19;uuid:"9c313e1a-d2e5-5154-96b6-684e7c0b8f23-PathSvg_0"}
D{i:20;uuid:"b250fb8b-0e0a-5f89-bd17-1b4662d2bcf9"}D{i:21;uuid:"1d9cebeb-f876-5872-9c65-0ce85468f95d"}
D{i:22;uuid:"8c03f127-b486-586d-a3db-fa654399339e"}D{i:23;uuid:"13fdd5a0-d59f-5425-8350-144bfff7d4e6"}
D{i:24;uuid:"179c56b3-fcb3-5988-a2f2-299480d247bf"}D{i:25;uuid:"3fd0224c-ef1a-5b4c-aa55-ab53c30b8119"}
D{i:26;uuid:"f3ca473a-da89-5dc7-bc0e-9ffe66d91883"}D{i:27;uuid:"f829307f-f181-5253-922f-820badb4890c"}
D{i:28;uuid:"40ddf0b3-b555-5d5b-a57a-bcaa2239af43"}D{i:29;uuid:"3dc706e1-9a94-5f49-b9d9-6157edfa2cde"}
D{i:30;uuid:"0016ba26-db63-56c8-a191-962d4d453297"}D{i:31;uuid:"52f91436-f03b-5344-9775-77c3cafb6e60"}
D{i:32;uuid:"5dd433fc-15f8-5d7a-b2d5-18c825eef662"}D{i:33;uuid:"b45c8e95-11a9-5192-91e2-fe7682a477bb"}
D{i:34;uuid:"9fc922a3-e3fa-5fdb-8aa1-5fdd585b2a8f"}D{i:35;uuid:"105c232c-083e-5a84-9abc-45a17ba26cfe"}
D{i:36;uuid:"cbed3a5c-56ec-524c-8dfe-7816dd02f47f"}D{i:37;uuid:"eca5bc9f-9394-5cbc-bfca-7a0436420b68"}
D{i:38;uuid:"0ff6a1e3-7625-52e5-97e4-84b901acab85"}D{i:39;uuid:"42dc5096-5203-5bc1-bfc6-c4425a918bba"}
D{i:40;uuid:"94a31f66-5493-53c5-bb9b-f100de49171f"}D{i:41;uuid:"3a664438-a317-5d1e-8318-158ad9b6fd59"}
D{i:42;uuid:"dedb1c12-4598-56b3-8b98-e2909d60eb4f"}D{i:43;uuid:"9f818e1f-d82a-5064-a7e3-ef1ba00855aa"}
D{i:44;uuid:"14754df1-0e57-5141-bab5-04f2328f2005"}D{i:45;uuid:"276a67f4-62a5-5f66-90f8-713a2589cba7"}
D{i:46;uuid:"5600073f-c782-5ede-9b93-2905be1ffa7f"}D{i:47;uuid:"36e8c020-42ee-53ad-8621-e72edaf11512"}
D{i:48;uuid:"8d395688-661e-512b-b897-7ff54f65ce51"}D{i:49;uuid:"8d395688-661e-512b-b897-7ff54f65ce51_ShapePath_0"}
D{i:50;uuid:"8d395688-661e-512b-b897-7ff54f65ce51-PathSvg_0"}D{i:51;uuid:"e079e93d-ca0f-506e-a0b4-d40fee07b32e"}
D{i:52;uuid:"34bdcb10-8bda-506b-859f-e4bd59201c32"}D{i:53;uuid:"3f4081f9-59b4-5d6a-ae67-6f990b56cb3c"}
D{i:54;uuid:"322c439f-ae02-5b18-900b-ab198f6f0310"}D{i:55;uuid:"51652017-2886-5a8e-a46d-ac56f384426e"}
D{i:56;uuid:"14984d3b-55b6-5b6f-8b3b-1ba8e3b118d6"}D{i:57;uuid:"14984d3b-55b6-5b6f-8b3b-1ba8e3b118d6_ShapePath_0"}
D{i:58;uuid:"14984d3b-55b6-5b6f-8b3b-1ba8e3b118d6-PathSvg_0"}D{i:59;uuid:"a212f0ce-94f1-5323-89db-8aa3f9577d4c"}
D{i:60;uuid:"cc550771-dfa0-5b86-87e1-828312af6400"}D{i:61;uuid:"9d2ca61c-9f60-5c34-959c-cb79e49a6873"}
D{i:62;uuid:"57e98164-acc7-5713-992e-deecdfb0984c"}D{i:63;uuid:"776b32f0-5654-5e43-b7aa-48925c0fee39"}
D{i:64;uuid:"fd1fb038-5089-53ef-b6f0-ec772891d182"}D{i:65;uuid:"ea569bc2-31b5-5ba3-8756-278fdf6e8748"}
D{i:66;uuid:"eb38e70c-d463-51b5-b46f-ecc176870ce8"}D{i:67;uuid:"f7529931-be60-537a-8026-cf51b0fd688e"}
D{i:68;uuid:"03b069ec-1918-568a-895b-9c7d25087385"}D{i:69;uuid:"a65e7195-92eb-5737-b2ae-a66c4640719d"}
D{i:70;uuid:"a3136f55-6915-5f3b-8585-b2c3e657986e"}D{i:71;uuid:"213773e9-46e9-533f-b8d7-cc27d468606c"}
D{i:72;uuid:"485d7c45-4ecc-5291-9748-49efb704f668"}D{i:73;uuid:"82bab08f-8311-5580-996d-b4934bdd5751"}
D{i:74;uuid:"b9c6855e-248b-5a61-aa33-a189b5309c5f"}D{i:75;uuid:"3eda502a-933a-5622-867d-d248b6a0bb4f"}
D{i:76;uuid:"80e1f7ad-f16b-50d9-9c0d-88afe66d1af1"}D{i:77;uuid:"3d29cb45-703d-5d7a-858d-48c82ba5a9f8"}
D{i:78;uuid:"06f9ffa8-36d7-539c-b858-a75a4c5d116a"}D{i:79;uuid:"bc1fac05-0c85-596a-91f3-2ab10fa22fa9"}
D{i:80;uuid:"0eefdd7d-3bb9-50a5-9c2c-0bd73fcb952b"}D{i:81;uuid:"71d53b65-888d-52ae-a7c4-f12d82f762fb"}
D{i:82;uuid:"3e95efe8-28dd-5ea3-ae3d-5a34ae412260"}D{i:83;uuid:"f0f18717-9b62-5132-bd3a-12c50e4787b8"}
D{i:84;uuid:"2f5f4b45-d1a4-5c5d-9100-ea8f1763d6ef"}D{i:85;uuid:"13fc8347-eb95-5df9-adf0-33ac8feebe9c"}
D{i:86;uuid:"802f7bef-11cc-5c78-ac9a-4b6eddd9628f"}D{i:87;uuid:"4cbf163e-d9ef-5359-ba33-7d6305526e98"}
D{i:88;uuid:"33846898-d1b1-5107-b9ac-fddd42270629"}D{i:89;uuid:"323a1517-0243-5b8a-b61b-bd4a2f59fd48"}
D{i:90;uuid:"29e4b979-1e5b-5a67-9928-550496c8c3f4"}D{i:91;uuid:"0a6fdf65-74d6-5aae-ba07-88335c164316"}
D{i:92;uuid:"cf23154a-4da7-5c71-9783-f13d21acb9fe"}D{i:93;uuid:"9ce92cc1-ccf3-56e7-85ff-c9329fb6736c"}
D{i:94;uuid:"aa977009-a964-5acb-84de-f3fd00b9c5c2"}D{i:95;uuid:"216c3e7d-3d0f-590e-a6b7-8fbfca6132ee"}
D{i:96;uuid:"e9bcc8f1-f7f6-542d-adb3-e56fb0cfb7dd"}D{i:97;uuid:"92260642-bdb0-5a79-aa63-e5635ed752d3"}
D{i:98;uuid:"ab599721-c1d1-5233-bee2-82e9e02d01d0"}D{i:99;uuid:"0e2d8310-9473-5435-83fa-5a9c4a89fe48"}
D{i:100;uuid:"b9539149-dbb2-56cb-9622-ed08ab71af89"}D{i:101;uuid:"b68bb7f3-de55-5681-8bf8-5f5c02e6fe27"}
D{i:102;uuid:"b68bb7f3-de55-5681-8bf8-5f5c02e6fe27_ShapePath_0"}D{i:103;uuid:"b68bb7f3-de55-5681-8bf8-5f5c02e6fe27-PathSvg_0"}
D{i:104;uuid:"c436c01d-d50a-557b-9756-61f99a364902"}D{i:105;uuid:"cac81a49-8849-5312-a226-b1cfb038bde6"}
D{i:106;uuid:"9e6adc71-6a7e-5f92-bda8-8ec644a42d17"}D{i:107;uuid:"cf9ae63b-20ee-5c4e-b400-0aa02cab1acb"}
D{i:108;uuid:"cf9ae63b-20ee-5c4e-b400-0aa02cab1acb_ShapePath_0"}D{i:109;uuid:"cf9ae63b-20ee-5c4e-b400-0aa02cab1acb-PathSvg_0"}
}
##^##*/

