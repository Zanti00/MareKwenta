import QtQuick
import QtQuick.Controls
import QtQuick.Shapes 1.15
import QtQuick.Studio.Components 1.0

Rectangle {
    id: pOPUP_SPLIT
    width: 493
    height: 429
    color: "transparent"
    property alias element1Text: element1.text
    property alias paymentsText: payments.text
    property alias _Text: _.text
    property alias cHARGEText: cHARGE.text
    property alias elementText: element.text
    property alias element2Text: element2.text
    property alias cHARGE1Text: cHARGE1.text
    property alias cashText: cash.text
    property alias cash1Text: cash1.text
    property alias splitText: split.text
    property alias element3Text: element3.text

    Image {
        id: rectangle_13
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -8
        anchors.rightMargin: -8
        anchors.topMargin: -4
        anchors.bottomMargin: -12
        source: "assets/rectangle_13_1.png"
    }

    Shape {
        id: arrow_1_Stroke_
        width: 26
        height: 29
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 23
        anchors.topMargin: 25
        layer.samples: 16
        layer.enabled: true
        ShapePath {
            id: arrow_1_Stroke__ShapePath_0
            strokeWidth: 4
            strokeColor: "transparent"
            PathSvg {
                id: arrow_1_Stroke__PathSvg_0
                path: "M 16.142427444458008 28.87088966369629 C 15.361413955688477 29.65190315246582 14.094383001327515 29.65183299779892 13.313325881958008 28.87088966369629 L 0.5857864618301392 16.14237403869629 C -0.1952621340751648 15.361325442790985 -0.1952621340751648 14.095297634601593 0.5857864618301392 13.314249038696289 L 13.313325881958008 0.5857338309288025 C 14.094383001327515 -0.19520950317382812 15.361413955688477 -0.19527965784072876 16.142427444458008 0.5857338309288025 C 16.92344093322754 1.3667473196983337 16.92337077856064 2.6337783336639404 16.142427444458008 3.4148354530334473 L 6.82797384262085 12.728311538696289 L 25.999849319458008 12.728311538696289 L 25.999849319458008 16.72831153869629 L 6.82797384262085 16.72831153869629 L 16.142427444458008 26.04178810119629 C 16.92337077856064 26.822845220565796 16.92344093322754 28.089876174926758 16.142427444458008 28.87088966369629 Z"
            }
            fillRule: ShapePath.WindingFill
            fillColor: "#708a2e"
        }
        antialiasing: true
    }

    Text {
        id: split
        width: 66
        height: 30
        color: "#4d2d18"
        text: qsTr("Split")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 88
        anchors.topMargin: 25
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Unbounded"
    }

    Text {
        id: payments
        width: 115
        height: 22
        color: "#4d2d18"
        text: qsTr("Payments")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 190
        anchors.topMargin: 88
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.Medium
        font.family: "Unbounded"
    }

    ArcItem {
        id: ellipse_2
        width: 46
        height: 42
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 276
        anchors.topMargin: 128
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "#4d2d18"
        outlineArc: true
        end: 450.00001
        begin: 90
        arcWidth: 23
        antialiasing: true
    }

    Text {
        id: element
        width: 16
        height: 30
        color: "#4d2d18"
        text: qsTr("+")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 291
        anchors.topMargin: 134
        font.pixelSize: 24
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        wrapMode: Text.NoWrap
        font.weight: Font.DemiBold
        font.family: "Unbounded"
    }

    Text {
        id: element1
        width: 22
        height: 32
        color: "#708a2e"
        text: qsTr("2")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 236
        anchors.topMargin: 132
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.Normal
        font.family: "Unbounded"
    }

    ArcItem {
        id: ellipse_3
        width: 46
        height: 42
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 171
        anchors.topMargin: 128
        strokeWidth: 1
        strokeStyle: 1
        strokeColor: "#4d2d18"
        outlineArc: true
        end: 450.00001
        begin: 90
        arcWidth: 23
        antialiasing: true
    }

    Text {
        id: _
        width: 13
        height: 30
        color: "#4d2d18"
        text: qsTr("_")
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 187
        anchors.topMargin: 123
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.NoWrap
        font.weight: Font.DemiBold
        font.family: "Unbounded"
    }

    Item {
        id: group_6
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 25
        anchors.rightMargin: 24
        anchors.topMargin: 261
        anchors.bottomMargin: 133
        Image {
            id: trash
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 8
            source: "assets/trash.png"
        }

        Shape {
            id: line_3_Stroke_
            width: 141
            height: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 33
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_3_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_3_Stroke__PathSvg_0
                    path: "M 0 0.999979555606842 L 0.006394577212631702 0 L 141.00662231445312 1.0203869342803955 L 141.00022888183594 2.0203664302825928 L 0 0.999979555606842 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: cash
            width: 45
            height: 17
            color: "#4d2d18"
            text: qsTr("Cash")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Image {
            id: down_Button
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 158
            anchors.topMargin: 5
            source: "assets/down_Button.png"
        }

        Rectangle {
            id: rectangle_12
            width: 104
            height: 35
            color: "#708a2e"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 340
        }

        Text {
            id: cHARGE
            width: 75
            height: 17
            color: "#f2efea"
            text: qsTr("CHARGE")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 354
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Shape {
            id: line_4_Stroke_
            width: 120
            height: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 200
            anchors.topMargin: 34
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_4_Stroke__ShapePath_0
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_4_Stroke__PathSvg_0
                    path: "M 0 0.999979555606842 L 0.006394577212631702 0 L 120.00326538085938 0.8683903813362122 L 119.99686431884766 1.8683699369430542 L 0 0.999979555606842 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: element2
            width: 42
            height: 17
            color: "#4d2d18"
            text: qsTr("₱ 90")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 279
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }
    }

    Item {
        id: group_7
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 25
        anchors.rightMargin: 24
        anchors.topMargin: 337
        anchors.bottomMargin: 57
        Image {
            id: trash1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 8
            source: "assets/trash1.png"
        }

        Shape {
            id: line_3_Stroke_1
            width: 141
            height: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 33
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_3_Stroke__ShapePath_1
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_3_Stroke__PathSvg_1
                    path: "M 0 0.999979555606842 L 0.006394577212631702 0 L 141.00662231445312 1.0203869342803955 L 141.00022888183594 2.0203664302825928 L 0 0.999979555606842 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: cash1
            width: 45
            height: 17
            color: "#4d2d18"
            text: qsTr("Cash")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 41
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Image {
            id: down_Button1
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 158
            anchors.topMargin: 5
            source: "assets/down_Button1.png"
        }

        Rectangle {
            id: rectangle_14
            width: 104
            height: 35
            color: "#708a2e"
            radius: 8
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 340
        }

        Text {
            id: cHARGE1
            width: 75
            height: 17
            color: "#f2efea"
            text: qsTr("CHARGE")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 354
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }

        Shape {
            id: line_4_Stroke_1
            width: 120
            height: 2
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 200
            anchors.topMargin: 34
            layer.samples: 16
            layer.enabled: true
            ShapePath {
                id: line_4_Stroke__ShapePath_1
                strokeWidth: 1
                strokeColor: "transparent"
                PathSvg {
                    id: line_4_Stroke__PathSvg_1
                    path: "M 0 0.999979555606842 L 0.006394577212631702 0 L 120.00326538085938 0.8683903813362122 L 119.99686431884766 1.8683699369430542 L 0 0.999979555606842 Z"
                }
                fillRule: ShapePath.WindingFill
                fillColor: "#4d2d18"
            }
            antialiasing: true
        }

        Text {
            id: element3
            width: 42
            height: 17
            color: "#4d2d18"
            text: qsTr("₱ 90")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 279
            anchors.topMargin: 9
            font.pixelSize: 14
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            font.weight: Font.Normal
            font.family: "Unbounded"
        }
    }

    Shape {
        id: line_2_Stroke_
        width: 442
        height: 3
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 25
        anchors.topMargin: 209
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
            fillColor: "#4d2d18"
        }
        antialiasing: true
    }
}

/*##^##
Designer {
    D{i:0;uuid:"7e95a24d-7b64-5a2a-9b2e-be8cde53adc8"}D{i:1;uuid:"b20d4829-1087-5ac4-8c8b-3a9e7cbc1b40"}
D{i:2;uuid:"28611898-ab41-50cd-937c-2f93d538dd52"}D{i:3;uuid:"28611898-ab41-50cd-937c-2f93d538dd52_ShapePath_0"}
D{i:4;uuid:"28611898-ab41-50cd-937c-2f93d538dd52-PathSvg_0"}D{i:5;uuid:"192be117-f313-5f00-9dae-2ada418be604"}
D{i:6;uuid:"a57957f8-43af-51a2-a929-c2047810de41"}D{i:7;uuid:"7bcbb77b-220b-579d-a96e-d97018c2f99a"}
D{i:8;uuid:"ddb8c484-7349-5bc0-948d-f8b1c22bc08c"}D{i:9;uuid:"819fb464-3e0f-517d-a6ad-b17ebed7c028"}
D{i:10;uuid:"0158d5cf-b29c-5887-adb6-c046b70485c7"}D{i:11;uuid:"f0d0b6f4-3cd0-5e30-8598-70f57204313c"}
D{i:12;uuid:"6debe551-fd41-515f-8e91-5d8aed1e5c13"}D{i:13;uuid:"c8c45edf-7979-5495-8d7b-65e9692317d3"}
D{i:14;uuid:"e76b99fb-952c-5d25-a143-3cb8f3bc82d8"}D{i:15;uuid:"e76b99fb-952c-5d25-a143-3cb8f3bc82d8_ShapePath_0"}
D{i:16;uuid:"e76b99fb-952c-5d25-a143-3cb8f3bc82d8-PathSvg_0"}D{i:17;uuid:"c5f9630d-d4eb-59fa-9b4c-16de016c7dc2"}
D{i:18;uuid:"816b2ebb-b71e-55d4-ad6e-dc48bdb41b44"}D{i:19;uuid:"a46b887e-e4a4-5878-948b-cac70e2426c5"}
D{i:20;uuid:"dca21e92-ea62-5845-a368-20983372a9e8"}D{i:21;uuid:"33f0993e-18c7-5701-9d0c-4ffb9bc916fc"}
D{i:22;uuid:"33f0993e-18c7-5701-9d0c-4ffb9bc916fc_ShapePath_0"}D{i:23;uuid:"33f0993e-18c7-5701-9d0c-4ffb9bc916fc-PathSvg_0"}
D{i:24;uuid:"f2f0fc0d-70c8-5fa9-bb3d-a9260fa50c68"}D{i:25;uuid:"7b6d1bf6-4cd8-582d-9f46-ae746a18c621"}
D{i:26;uuid:"094d6a69-84b5-5ac9-9590-119559d11b28"}D{i:27;uuid:"71745c79-93a3-56bd-9c76-beb080b3f353"}
D{i:28;uuid:"71745c79-93a3-56bd-9c76-beb080b3f353_ShapePath_0"}D{i:29;uuid:"71745c79-93a3-56bd-9c76-beb080b3f353-PathSvg_0"}
D{i:30;uuid:"2dbd8b9c-5feb-5ed0-8319-5ba6be3ebccf"}D{i:31;uuid:"cd693e46-7118-536d-80dc-cbc527c456d8"}
D{i:32;uuid:"a949bd1b-5260-59fc-9a96-e449480adbc3"}D{i:33;uuid:"741a693e-4de7-5412-9dea-83a5a5d738f2"}
D{i:34;uuid:"085d2b46-b047-5592-98a6-adb789671b3c"}D{i:35;uuid:"085d2b46-b047-5592-98a6-adb789671b3c_ShapePath_0"}
D{i:36;uuid:"085d2b46-b047-5592-98a6-adb789671b3c-PathSvg_0"}D{i:37;uuid:"8b406b9d-4b80-5d71-9e10-c98e555329f3"}
D{i:38;uuid:"188bda66-706f-503b-93ae-2303989bc818"}D{i:39;uuid:"188bda66-706f-503b-93ae-2303989bc818_ShapePath_0"}
D{i:40;uuid:"188bda66-706f-503b-93ae-2303989bc818-PathSvg_0"}
}
##^##*/

