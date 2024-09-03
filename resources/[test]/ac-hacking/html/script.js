var apps = []
var keys = [];
var ipMacArr = []
var progressValue = 0;
var noteId = 0
var propId = 0
var index = 0;
var coin = 0;
var tempCoin = 0;
var progressInterval = ""
var page = ""
var noteType = ""
var currentLevel = ""
var keyBox = ""
var currentPage = ""
var crackGame = false
var connectWifiTime = 0
var currentGameTime = 0
var currentGameMultiplier = 0
pagesClass = [".page-hq",".page-binunce",".page-minerext",".page-drone",".page-wally",".page-miner", ".bg", ".page-scan", ".pageone", ".pagetwo", ".pagethree", ".page-notepad" ,".page-appstore"];

pages = {
    "page-scan": {
        "title": "Salty",
        "description": "Scan for accessible WI-FI: Reveals MAC , fake IP, and security difficulty.",
        "image": "../images/scan.png",
    },
    "pageone": {
        "title": "Smoke Crack",
        "description": "Enter details and hack specific Wİ-Fİ networks.",
        "image": "../images/mask2.png",
    },
    "page-notepad":{
        "title": "Notepad",
        "description": "Notepad for secure passwords, and more.",
        "image": "../images/notepad.png",
    },
    "page-appstore":{
        "title": "App Store",
        "description": "Download and install applications.",
        "image": "../images/app.png",
    },
    "page-miner": {
        "title": "Miner",
        "description": "Mine for crypto currency.",
        "image": "../images/miner.png",
    },
    "page-wally": {
        "title": "Wally",
        "description": "Username,Crypto Address,and more.",
        "image": "../images/wallet.png",
    },
    "page-drone": {
        "title": "Drone",
        "description": "Buy items.",
        "image": "../images/drone.png",
    },
    "page-minerext": {
        "title": "MinerEXT",
        "description": "Mining rack setup.",
        "image": "../images/minerext.png",
    },
    "page-binunce": {
        "title": "Binunce",
        "description": "Public crypto transactions: users, MAC, addressess, amounts",
        "image": "../images/binunce.png",
    },
    "page-hq" : {
        "title": "HQ",
        "description": "Manage the HQ and unlock new features.",
        "image": "../images/hq3.png",
    },
}

gameData = {
    "Hard Level": {
        time : 10,
        multiplier : 10
    },
    "Mid Level": {
        time : 20,
        multiplier : 5
    },
    "Easy Level": {
        time : 25,
        multiplier : 4
    },
}
  
window.addEventListener("message", function (e) {
    $("body").fadeIn(500);
    appendHtml()
    e = e.data

    switch (e.action) {
    case "open":
        return openMenu(e)
    case "openBuild":
        return openBuild(e.data)
    case "openProps":
        return openProps(e.data)
    case "setPropsData":
        return setPropsData(e.data)
    case "openMiner":
        return openMiner(e.data)
    case "newMiner":
            return newMiner(e.data)
    case "close":
            return $("body").fadeOut(500);
      default:
        return;
    }
});

document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        $("body").fadeOut(500);
        $.post(`http://ac-hacking/close`, JSON.stringify({ }), function (x) {});
    }
});

function openMenu(data) {
    $("body").fadeIn(500);
    $(".all-page").show();
    $(".computer-build,.create-prop-page").hide();
    $(".not-list-box").empty();
    $(".butcoinupdate").text(data["data"]["cacheData"]["temporaryCoin"] + " BUTCOIN");
    coin = data["data"]['cacheData']["butcoin"]
    tempCoin = data["data"]['cacheData']["temporaryCoin"]
    connectWifiTime = data["data"]['cacheData']["connectWifiTime"]
    if (data['data']['cacheData']['connectWifiTime'] == null) {
        $(".wifi-text").html("Not connected");
        $(".wifi-pop-up img").css('display', 'block');
    }else{
        $(".wifi-text").html(`Until ${data['data']['cacheData']['connectWifiTime']} you will be connected to wifi`);
        $(".wifi-pop-up img").css('display', 'none');
        $(".connectedd").text('Connected');
        $(".top-item-alt-box").css('color', '#0ceebf');
        $(".top-item-alt-box").css('background-color', '#152528');
        $(".top-item-alt-box").css('border', '1px dashed #1f4147');
    }
    setDroneItem(data["config"])
    setNotes(data["data"]['cacheData'])
    setWallet(data["data"]['cacheData'])
    setAppStore(data["config"],data["data"]['cacheData'])
    setBinunce(data["data"]["binunceData"])
    setMinerExt(data["data"]["cacheData"])
    coinUpdate(data["data"]["cacheData"]["butcoin"])
    apps = data["data"]['cacheData']["apps"]
}
function setMinerExt(data) {
    $(".minerext-box").empty();
    myMiner = [];
    gpuCount = 0;

    if (data["props"] && data["props"].length > 0) {

        $.each(data["props"], function (i, v) {
            if (data["miner"] && data["miner"].length > 0) {
                $.each(data["miner"], function (x, y) {
                    if (y.propId == v.objId) {
                        myMiner.push(y);
                    }
                });
            }

            gpuCount = myMiner.filter(miner => miner.propId === v.objId).length;

            if (v.itemType == "miner") {
                if (v.linked == true) {
                    $(".minerext-box").append(`
                    <div class="minerext-item">
                        <div class="minerext-header">GPU RACK #${i}</div>
                        <div class="minerext-alt">Linked rack</div>
                        <div class="gpus-count">${gpuCount} GPUs</div>
                        <div class="butcday-count">${gpuCount / 20.0} BUTC/DAY</div>
                        <div class="ghz-count">${gpuCount / 10} Ghz</div>
                        <img src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <div class="connecter-first"></div>
                        <div class="connecter-first-line"></div>
                        <div class="connecter-middle-circle">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="connecter-first" style="left: 117.6%;"></div>
                        <div class="connecter-first-line" style="left: 116.6%;"></div>
                    </div>
                    `);
                } else {
                    $('.minerext-box').append(`
                    <div style="height: 22.5%;" class="minerext-item ">
                        <div data-id="${v.objId}" class="linked">Link</div>
                        <div class="minerext-header" style="inset: 42% 20% 36% 30%;">GPU RACK #${i}</div>
                        <img style="background-color: transparent;inset: -23% 10% 20% 35%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <img style="background-color: transparent;inset: -15% 10% 20% 22%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <img style="background-color: transparent;inset: -15% 10% 20% 53%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <div class="connecter-first"></div>
                        <div class="connecter-first-line"></div>
                        <div class="connecter-middle-circle">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="connecter-first" style="left: 117.6%;"></div>
                        <div class="connecter-first-line" style="left: 116.6%;"></div>
                    </div>`);
                }
            }
        });
    }

    $(".minerext-box").append(`
    <div class="minerext-item lastitem">
        <div class="butcoin-info-alt-box">
            <hr class="hr">
            <hr style="inset: 48% 7% 1% 8%;" class="hr">
            <hr style="inset: 48% 7% 1% 11%;" class="hr">
            <hr style="inset: 48% 7% 1% 94%;" class="hr">
            <hr style="inset: 48% 7% 1% 91%;" class="hr">
            <hr style="inset: 48% 7% 1% 88%;" class="hr">
            <div class="test"></div>
            <div class="butcoin-count butcoinupdate">0.06940 BUTCOIN</div>
            <div class="butcoin-text">1 BUTc / 24 Saat</div>
        </div>
    </div>
    `);

    $(".butcoinupdate").text(tempCoin + " BUTCOIN");
}


// bu kısım do not repeat yourself prensibine göre tekrar yazılacak geçiçi kod
function setNewMinerExt(data) { 
    $(".minerext-box").empty()
    myMiner = []
    gpuCount = 0
    $.each(data, function (a, b) {
    if (b["props"] && b["props"].length > 0) {
        $.each(b["props"], function (i, v) {
            if (b["miner"] && b["miner"].length > 0) {
                $.each(b["miner"], function (x,y) {
                    if (y.propId == v.objId) {
                        myMiner.push(y)
                        gpuCount = myMiner.length
                        return
                    }else{
                        myMiner = []
                        gpuCount = 0
                    }
                })
            }

            if (v.itemType=="miner") {
                if(v.linked == true){
                    $(".minerext-box").append(`
                    <div class="minerext-item">
                    <div class="minerext-header">GPU RACK #${i}</div>
                    <div class="minerext-alt">Linked rack</div>
                    <div class="gpus-count">${gpuCount} GPUs</div>
                    <div class="butcday-count">${gpuCount / 20.0 } BUTC/DAY</div>
                    <div class="ghz-count">${gpuCount/10} Ghz</div>
                    <img src="../images/ac_gpu.png" class="gpu-img" alt="">
                    <div class="connecter-first"></div>
                    <div class="connecter-first-line"></div>
                    <div class="connecter-middle-circle">
                    <i class="fa fa-check"></i>
                    </div>
                    <div class="connecter-first" style="left: 117.6%;"></div>
                    <div class="connecter-first-line" style="left: 116.6%;"></div>
                    </div>
                    `)              
                }else{
                    $('.minerext-box').append(`
                    <div style="height: 22.5%;" class="minerext-item ">
                        <div data-id="${v.objId}" class="linked">Link</div>
                        <div class="minerext-header" style="inset: 42% 20% 36% 30%;">GPU RACK #${i}</div>
                        <img style="background-color: transparent;inset: -23% 10% 20% 35%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <img style="background-color: transparent;inset: -15% 10% 20% 22%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <img style="background-color: transparent;inset: -15% 10% 20% 53%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
                        <div class="connecter-first"></div>
                        <div class="connecter-first-line"></div>
                        <div class="connecter-middle-circle">
                          <i class="fa fa-check"></i>
                        </div>
                        <div class="connecter-first" style="left: 117.6%;"></div>
                        <div class="connecter-first-line" style="left: 116.6%;"></div>
                    </div>`)
                }
            }

    })}
})
    $(".minerext-box").append(`
    <div class="minerext-item lastitem">
        <div class="butcoin-info-alt-box">
          <hr class="hr">
          <hr style="inset: 48% 7% 1% 8%;" class="hr">
          <hr style="inset: 48% 7% 1% 11%;" class="hr">
          <hr style="inset: 48% 7% 1% 94%;" class="hr">
          <hr style="inset: 48% 7% 1% 91%;" class="hr">
          <hr style="inset: 48% 7% 1% 88%;" class="hr">
          <div class="test"></div>
          <div class="butcoin-count butcoinupdate">0.06940 BUTCOIN</div>
          <div class="butcoin-text">1 BUTc / 24 Hours</div>
        </div>
    </div>
    `)

}

function newMiner(data) { 
    $('minerext-box').append(`
    <div style="height: 22.5%;" class="minerext-item ">
        <div data-id="${data["data"]["objId"]}" class="linked">Link</div>
        <div class="minerext-header" style="inset: 42% 20% 36% 30%;">GPU RACK #4</div>
        <img style="background-color: transparent;inset: -23% 10% 20% 35%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
        <img style="background-color: transparent;inset: -15% 10% 20% 22%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
        <img style="background-color: transparent;inset: -15% 10% 20% 53%;width: 10%;height: 50%;" src="../images/ac_gpu.png" class="gpu-img" alt="">
        <div class="connecter-first"></div>
        <div class="connecter-first-line"></div>
        <div class="connecter-middle-circle">
          <i class="fa fa-check"></i>
        </div>
        <div class="connecter-first" style="left: 117.6%;"></div>
        <div class="connecter-first-line" style="left: 116.6%;"></div>
    </div>`)

}

function setBinunce(data) {
    $(".binunce-list-box").empty()
    if (data && data.length > 0) {
        $.each(data, function (i, v) {
            $(".binunce-list-box").append(`
            <div class="binunce-item">
                <div class="sender-username">${v.senderusername}</div>
                <div class="sender-address">${v.senderaddress}</div>
                <div class="receiver-address">${v.receiveraddress}</div>
                <div class="mac-address">${v.macaddress}</div>
                <div class="amount">${v.amount}</div>
              </div>
        `)
        })
    }
}

function setWallet(data) {
    $('.cryptoaddress').html(data.cryptoaddress);
    $('.popup-input .cryptoinput').val(data.cryptoaddress);
    $('.popup-input .cryptoamount').val(data.butcoin); 
    $('.popup-input .setData').html(data.cryptoaddress); 
    $('.macaddress').html(data.macaddress);
    $('.profilusername').html(data.username);
}

function setNotes(data) {
  $(".not-list-box").empty();
    if (data["notes"] && data["notes"].length > 0) {
            $.each(data["notes"], function (i, v) {
                $(".not-list-box").append(`
                <div data-id="${v.id}" data-header="${v.header}" data-text="${v.text}" class="not-item">
                    <i class="fa fa-file-text"></i>
                    <div class="green-line"></div>
                    <div class="note-header">${v.header}</div>
                    <div class="note-time">${v.date}</div>
                </div>
            `)
        })
}}
function setAppStore(data, myData) {
    var appsBox = $(".apps-box");
    appsBox.empty();

    $.each(data["AppStore"], function (i, v) {
        var isAppInstalled = isAppInstalledByName(myData["apps"], v.appName);
        var k = v;
        appsBox.append(`
            <div class="app-item">
                <img src="${isAppInstalled ? v.appImg : k.appImg}" alt="">
                <div class="app-name">${isAppInstalled ? k.appName : v.appName}</div>
                <div class="app-desc">${isAppInstalled ? k.appDesc : v.appDesc}</div>
                <div class="app-status">
                    ${isAppInstalled ? '<div class="app-status-button">Installed</div>' : getAppStatusHTML(v)}
                </div>
            </div>
        `);
    });
}

function openProps(data) { 
    $(".prop-box").empty();
    $(".computer-build , .all-page,.miner-item-page").hide();
    $(".create-prop-page").show();
    $.each(data, function (i, v) {
        $(".prop-box").append(`
        <div data-itemname="${v.itemname}" data-hash="${v.hash}" data-propname="${v.propname}" class="prop-item">
            <img src="../images/${v.propname}.png" class="prop-img" alt="">
            <div class="prop-item-name">${v.label}</div>
            <div class="right-box">></div>
        </div>
        `)
    })
}

function setPropsData(data) {
    $('.posx').html(data["position"]["x"]);
    $('.posy').html(data["position"]["y"]);
    $('.posz').html(data["position"]["z"]);
    $('.rotx').html(data["rotation"]["x"]);
    $('.roty').html(data["rotation"]["y"]);
    $('.rotz').html(data["rotation"]["z"]);
}

function isAppInstalledByName(apps, appName) {
    return apps.some(function (app) {
        return app.appName === appName;
    });
}

function getAppStatusHTML(appData) {
    if (appData.appType === "notyet") {
        return '<div class="app-notavailable">Not Available</div>';
    } else {
        var installButtonHTML = `<div data-name="${appData.appName}" data-coin="${appData.appCoin}" class="app-install-button">Install</div>`;
        var coinCountHTML = `<div class="app-coin-count">${appData.appCoin} BUTC</div>`;

        return `${installButtonHTML}${coinCountHTML}`;
    }
}


function setDroneItem(data) {
    $(".drone-item-box").empty();
    $.each(data["BluePrintItem"], function (i, v) {
        $(".drone-item-box").append(`
        <div class="drone-item">
            <div  class="item-alt-bg"></div>
            <div class="item-alt-hr"></div>
            <img src="${v.itemImg}" class="item-img" alt="">
            <img src="../images/miniicon.png" class="item-minicon" alt="">
            <div class="butc-bg">BUTC</div>
            <div class="butc-count">${v.butCoin}</div>
            <div class="item-name">${v.itemLabel}</div>
            <div data-item="${v.itemName}" data-type="${v.itemType}" data-coin="${v.butCoin}" class="buy-box">
              <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </div>
        </div>
        `)
    })
}

function openBuild(data) { 
    $(".all-page,.create-prop-page,.miner-item-page").hide();
    $(".computer-build ").show();
    len = 1;
    if (data["sendData"]) {
        hddValue = data["sendData"]["hdd"]
        cpuValue = data["sendData"]["cpu"]
        gpuValue = data["sendData"]["gpu"]
        vpnValue = data["sendData"]["vpn"]

        if (hddValue <= 100 && hddValue > 0) {
            $(`.hdd`).append(`<img src="../images/ac_hdd.png" alt="hdd"><div class="durability-bot"></div>`);
            $(`.hdd .durability-bot`).css("right", `${100-hddValue}%`);
        }

        if (cpuValue <= 100 && cpuValue > 0) {
            $(`.cpu`).append(`<img src="../images/ac_cpu.png" alt="cpu"><div class="durability-bot"></div>`);
            $(`.cpu .durability-bot`).css("right", `${100-cpuValue}%`);
        }    

        if (gpuValue <= 100  && gpuValue > 0) {
            $(`.gpu`).append(`<img src="../images/ac_gpu.png" alt="gpu"><div class="durability-bot"></div>`);
            $(`.gpu .durability-bot`).css("right", `${100-gpuValue}%`);
        }

        if (vpnValue <= 100 && vpnValue > 0) {
            $(`.vpn`).append(`<img src="../images/ac_vpn.png" alt="vpn"><div class="durability-bot"></div>`);
            $(`.vpn .durability-bot`).css("right", `${100-vpnValue}%`);        
        }
    }

    $(".myinv-item-build").empty();
    $.each(data["inventory"], function (i, v) {
        $(`#build-${i}`).append(`<img src="../images/${v.name}.png">  <div class="durability-bottom"></div>`);
    })
        
}


function openMiner(data) {
    propId = data["propId"];
    len = 1;

    $('.all-page, .create-prop-page, .computer-build').hide();
    $('.miner-item-page').show();
    
    if (data["empty"]==true) {
        $(".miner-item").empty()
    }

    let inventoryLength = data["inventory"].length;

    for (let i = 0; i < inventoryLength; i++) {
        $("#" + i).append(`<img src="../images/${data["inventory"][i].name}.png">  <div class="durability-bottom"></div>`);
    }

    let minerLength = data["miner"].length;
    for (let i = 0; i < minerLength; i++) {
          $("#miner-" + i).append(`<img src="../images/${data["miner"][i].item}" alt="${data["miner"][i].item}"> <div style="right:${data["miner"][i].durability}%" class="durability-bottom"></div>`);
      }   
}


function startGame() {
    currentGameTime = gameData[currentLevel].time
    currentGameMultiplier = gameData[currentLevel].multiplier
    if (crackGame == true) {
        progressInterval = setInterval(updateProgress, 1000);
        $(document).on('keydown.crackGame', function(event) {
            var keyPressed = String.fromCharCode(event.keyCode);
            checkKey(keyPressed);
        });
    for (var i = 0; i < 12; i++) {
        var randomKey = generateRandomKey();
        keys.push(randomKey);
        var keyItem = $("<div class='key-item'><div class='key-text'>" + randomKey + "</div></div>");
        keyBox.append(keyItem);
    }
  }else{
    $(document).off('keydown.crackGame');
  }
}

function failed(status) {

    if (status=="success") {
        $(".notify-box").css({display: "flex" , background: "#003038" });
        $(".progress-bg").css("display", "none");
        $('.notify-header').text("Crack successful.")
        $('.notify-alt').text("You have successfully cracked the network. You are now connected to the network.")
        $('.notify-header').css({color:'#037e7e',textShadow:'0 0 10px #0a797e'})   
    }else{
    $(".notify-box").css("display", "flex");
    $(".progress-bg").css("display", "none");
    $(".notify-header").text("Crack failed.")
    $(".notify-alt").text("You have failed to crack the network. Please try again.")
    $(".notify-header").css({color:'#ff5757',textShadow:'0 0 10px #ff5757'})
    }

    setTimeout(() => {
        $(".notify-box").css("display", "none");
        $(".progress-bg").css("display", "block");
    }, 1000);
    $(".progressbar-time").text(0 + " sec left");

    $(".border-item").find("span").remove();
    $(".key-box").empty();
    keys = [];
    index = 0;
    currentLevel = ""
    ipMacArr = []
    keyBox = ''
    $(".border-item").css({'border':'1.5px solid #2d3137', 'box-shadow':'none', 'background':'none', 'color':'#47988a', 'text-shadow':'none'})
    $(".key-item").css("background", "linear-gradient(to bottom, white 85%, #ccc 15%)"); 
    
    setTimeout(() => {
        hideAllPage()
    }, 1000);
    return;

}
currentTime = 0

function updateProgress() {
    progressValue += currentGameMultiplier;
    $(".progress").css("width", progressValue + "%");
    time = currentGameTime -=1;
    currentTime = time
    $(".progressbar-time").text(currentTime + " sec left");
    if (progressValue >= 99) {
        progressReset();
        failed();
        return;
    }
}

function progressReset() { 
    crackGame = false
    currentTime = 0
    progressValue = 0
    $(".progressbar-time").text(0 + " sec left");
    $(".progress").css("width", "0%");
    clearInterval(progressInterval);
    progressInterval = "";
    $(document).off('keydown.crackGame');
}



function generateRandomKey() {
    var characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var randomIndex = Math.floor(Math.random() * characters.length);
    return characters.charAt(randomIndex);
}

function checkKey(key) {
    if (crackGame == true) {
    var currentKey = keys[index];
    var keyItem = $(".key-item").eq(index);
    var borderItem = $(".border-item").eq(index);
    var checkMarkSpan = $("<span>").text("✓");
    var crossMarkSpan = $("<span>").text("✗");
    if (key === currentKey) {
        borderItem.append(checkMarkSpan);
        borderItem.css({'border':'1.5px solid #17e4b2', 'box-shadow':'0px 0px 10px 0px rgba(23,228,178,0.75)', 'background':'#185249', 'color':'#47988a', 'text-shadow':'0px 0px 10px rgba(23,228,178,0.75)'})
        keyItem.css("background", "linear-gradient(to bottom, #17e4b2 85%, #29a385 15%)");
    } else {
        borderItem.append(crossMarkSpan);
        borderItem.css({'border': '1.5px solid #ff5757', 'box-shadow': '0px 0px 10px 0px rgba(255, 87, 87, 0.75)', 'background': '#8c1d1d','color': '#ff9595', 'text-shadow': '0px 0px 10px rgba(255, 87, 87, 0.75)'});
        crackGame = false
        progressReset();
        failed();
        borderItem.find("span").remove();
        return;
    }

    // emtpy all data    

    index++;

    if (index === keys.length) {
        crackGame = false
        setTimeout(() => {
            progressReset();
            createNotify("pageone", "Crack successful.")
            connectWifi(currentLevel)
            failed("success");
            borderItem.find("span").remove();
        }, 1000);
        index = 0;
    }
}
}


function generateMACAddress() {
    var macAddress = "";
    for (var i = 0; i < 6; i++) {
        var hexDigit = Math.floor(Math.random() * 256).toString(16);
        macAddress += (hexDigit.length === 1 ? "0" : "") + hexDigit;
        if (i < 5) {
            macAddress += ":";
        }
    }
    return macAddress.toUpperCase();
}

function generateIPAddress() {
    var ipAddress = "";
    for (var i = 0; i < 4; i++) {
        ipAddress += Math.floor(Math.random() * 256);
        if (i < 3) {
            ipAddress += ".";
        }
    }
    return ipAddress;
}

$(".ip-item").each(function() {
    var macText = $(this).find(".mac-text");
    var ipText = $(this).find(".ip-text");
    macText.text(generateMACAddress());
    ipText.text(generateIPAddress());
});

function getRandomLevel() {
    var levels = ["Easy Level", "Mid Level", "Hard Level"];
    return levels[Math.floor(Math.random() * levels.length)];
}

function getLevelColors(level) {
    switch (level) {
        case "Easy Level":
            return ["#22e3bd", "#22e3bd"];
        case "Mid Level":
            return ["#e0d80b", "#e0d80b", "#e0d80b"];
        case "Hard Level":
            return ["#ff6161", "#ff6161", "#ff6161", "#ff6161"];
        default:
            return [];
    }
}

function getTextShadowColors(level) {
    switch (level) {
        case "Easy Level":
            return "0 0 10px #22e3bd";
        case "Mid Level":
            return "0 0 10px #e0d80b";
        case "Hard Level":
            return "0 0 10px #ff6161";
        default:
            return "";
    }
}

function updateDate() {
    const now = new Date();
    const year = now.getFullYear();
    const month = (now.getMonth() + 1).toString().padStart(2, '0');
    const day = now.getDate().toString().padStart(2, '0');
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');

    const formattedDate = `<span style="color:white;">${month}/${day}/${year} - <span style="color: #00bb90;">${hours}</span><span style="color:#00bb90;" >:</span><span style="color: #00bb90;">${minutes}</span></span>`;
    
    $(".liveDate").html(formattedDate);
    return `${month}/${day}/${year},${hours}:${minutes}`;
}

updateDate();
setInterval(updateDate, 60000);


var orderArray = [];
var minerArray = [];
var myinvArray = [];

$(".app-box").sortable({
  update: function(event, ui) {
    orderArray = $(this).sortable('toArray', { attribute: 'data-page' });
    localStorage.setItem('appOrder', JSON.stringify(orderArray));
    applyCssForOrder(orderArray);
  },
  axis: "xy", 
  revert: true, 
  tolerance: "pointer",
});

function applyCssForOrder(order) {
    var appElements = $('.app-box .app');
    var targetElement = $('.app-box')
    targetElement.append(appElements.detach().sort(function(a, b) {
        return order.indexOf($(a).data('page')) - order.indexOf($(b).data('page'));
    }));
}

function setApp() {
  var order = localStorage.getItem('appOrder');
  var miner = localStorage.getItem('minerinvapp');
  var myinv = localStorage.getItem('myinvapp');
  if (order) {
    applyCssForOrder(JSON.parse(order));
  }

    if (miner) {
        cssey(JSON.parse(miner));
    }

    if (myinv) {
        csszort(JSON.parse(myinv));
    }
}

setApp(); 

$(".miner-box").sortable({
    update: function(event, ui) {
        minerArray = $(this).sortable('toArray', { attribute: 'data-page' });
      localStorage.setItem('minerinvapp', JSON.stringify(minerArray));
      cssey(minerArray);
    },
    axis: "xy", 
    revert: true, 
    tolerance: "pointer",
});

function cssey(order) {
    var appElements = $('.miner-box .miner-item');
    var targetElement = $('.miner-box')
    targetElement.append(appElements.detach().sort(function(a, b) {
        return order.indexOf($(a).data('page')) - order.indexOf($(b).data('page'));
    }));
}

$(".myinv-box").sortable({
    update: function(event, ui) {
        myinvArray = $(this).sortable('toArray', { attribute: 'data-page' });
      localStorage.setItem('myinvapp', JSON.stringify(myinvArray));
      csszort(myinvArray);
    },
    axis: "xy", 
    revert: true, 
    tolerance: "pointer",
  });

function csszort(order) {
    var appElements = $('.myinv-box .myinv-item');
    var targetElement = $('.myinv-box')
    targetElement.append(appElements.detach().sort(function(a, b) {
        return order.indexOf($(a).data('page')) - order.indexOf($(b).data('page'));
    }));
}


$(".myinv-box-build").sortable({
    update: function(event, ui) {
        myinvArray = $(this).sortable('toArray', { attribute: 'data-page' });
      localStorage.setItem('myinvapp', JSON.stringify(myinvArray));
      csszart(myinvArray);
    },
    axis: "xy", 
    revert: true, 
    tolerance: "pointer",
  });

function csszart(order) {
    var appElements = $('.myinv-box-build .myinv-item-build');
    var targetElement = $('.myinv-box-build')
    targetElement.append(appElements.detach().sort(function(a, b) {
        return order.indexOf($(a).data('page')) - order.indexOf($(b).data('page'));
    }));
}
$(".build-item-box").sortable({
    update: function(event, ui) {
        myinvArray = $(this).sortable('toArray', { attribute: 'data-page' });
      localStorage.setItem('myinvapp', JSON.stringify(myinvArray));
      csszert(myinvArray);
    },
    axis: "xy", 
    revert: true, 
    tolerance: "pointer",
  });

function csszert(order) {
    var appElements = $('.build-item-box .build-item');
    var targetElement = $('.build-item-box')
    targetElement.append(appElements.detach().sort(function(a, b) {
        return order.indexOf($(a).data('page')) - order.indexOf($(b).data('page'));
    }));
}



function hideAllPage() {  
    pagesClass.forEach(page => {
        $(page).hide();
      });
}


function createNotify(category,text) {  
    header = pages[category].title
    image = pages[category].image
    $(".notify-list-box").append(`
    <div class="notify-list-item">
              <div class="notify-pop-close">X</div>
              <div class="notify-pop-alt-header">${header}</div>
              <div class="notify-pop-alt-text">${text}</div>
              <img src="${image}" class="notify-alt-img" alt="">
    </div>
    `)
    $(".notify-alt-box").empty()
    $(".notify-alt-box").append(`
    <div class="item">
        <div class="notify-close">X</div>
        <div class="notify-alt-header">${header}</div>
        <div class="notify-alt-text">${text}</div>
        <img src="${image}" class="notify-alt-img" alt="">
    </div>
  `)

  $(".notify-alt-box").fadeIn(300);
    setTimeout(() => {
        $(".notify-alt-box").fadeOut(300);
    }, 3000);
}

// connectWifi("Hard Level")

function connectWifi(level) {  
    $.post(`http://ac-hacking/connectWifi`, JSON.stringify({level:level}), function (x) {
      connectWifiTime = x
      $(".wifi-text").html(`Until ${x} you will be connected to wifi`);
      $(".wifi-pop-up img").css('display', 'none');
      $(".connectedd").text('Connected');
      $(".top-item-alt-box").css('color', '#0ceebf');
      $(".top-item-alt-box").css('background-color', '#152528');
      $(".top-item-alt-box").css('border', '1px dashed #1f4147');
    })
}

macInterVal = ""
function startProgressMac() {
    macInterVal = setInterval(updateProgressMac, 1000);
}

function updateProgressBarMac(progress) {
    $(".mac-progress").css("width", progress + "%");

    var timeLeft = Math.ceil(((100 - progress) / 100) * 20); 

    $(".mac-progressbar-time").text(timeLeft + " sec left");
}

function updateProgressMac() {
    progressValue += 5;

    updateProgressBarMac(progressValue);
    if (progressValue >= 100) {
        resetPageState()
        hideAllPage()
        return;
    }
}

function resetPageState() {
  currentPage = "";
  clearInterval(macInterVal);
  macInterVal = "";
  progressValue = 0;
  $(".mac-progressbar-time").text(0 + " sec left");
  $(".mac-progress").css("width", "0%");
  $(".page-scan").hide();
  $('.pagethree').hide();
}

function coinUpdate(coin) {
    $(".walletcoin").text(coin + " BUTCOIN");
}


dataType = ""
$(document).on('click', '.wifi-icon-box', function (e) {
    $(".settings-pop-up , .wifi-pop-up , .notify-pop-up").hide();
    if (dataType == $(this).data("type")) {
        $("."+dataType).fadeOut(500);
        $(this).css('background', 'linear-gradient(to bottom, #343844, #21242f)') 
        return dataType = "";   
    }
    dataType = $(this).data("type");
    $("."+dataType).show()
    $(".wifi-icon-box").css('background', 'linear-gradient(to bottom, #343844, #21242f)')
    $(this).css('background', 'linear-gradient(to bottom, #05e9b2, #05e9b2)')    
})

$(document).on('click', '.popup-cancel-button', function(e) {
    $(".popup").fadeOut(300);

})

$(document).on('click', '.linked', function (e) {
    id = $(this).data("id")
    $.post(`http://ac-hacking/linked`, JSON.stringify({id:id}), function (x) {
        coinUpdate(x.butcoin)
        if (x==false) {
            createNotify("page-minerext", "Linked error.")
        }else{
            createNotify("page-minerext", "Successfully linked crack.")
            setNewMinerExt(x)
        }
    })
})

$(document).on('click', '.notify-pop-close', function (e) {
    $(this).parent().remove()
})


$(document).on('click', '.home-page .settings-pop-up .save-button', function (e) {
    let bg = $(".home-page .settings-pop-up input").val()
    $(".home-page .background").attr('src', bg)
})

$(document).on('click', '.bg .alt-box .box .crack-button-box', function (e) {
    macInput = $(".mac-input-box input").val()
    ipInput = $(".ip-input-box input").val()

    $(".infomac").text(macInput)
    $(".infoip").text(ipInput)

    if (macInput == "" || ipInput == "") {
        createNotify("pageone", "Please fill in the blanks.")
        return
    }

    var found = false;

    $.each(ipMacArr, function (i, v) {        
        if (v.mac === macInput && v.ip === ipInput) {
            var level = v.level;
            $(".pageone").hide();
            $(".pagetwo").show();
            currentLevel = level;
            progressValue = 0;
            crackGame = true
            startGame();
            createNotify("pageone", "Crack started.");
            found = true;
            return false;
        }
    });
    
    if (!found) {
        crackGame = false
        createNotify("pageone", "Wrong MAC or IP address.");
    }

})



$(document).on('click', '.scan-button', function (e) {

    $.post(`http://ac-hacking/scanWifi`, JSON.stringify({}), function (x) {
        if (x) {
            coinUpdate(x.coin)
            createNotify("page-scan", "Wifi scanned.")
            ipMacArr = []
            crackGame = false
            currentPage = ""
            // reset 
            $('.ip-item .level-box .level-item').css('background-color', '#595a5e');
            $('.ip-item .level-text').css('color', '#22e3bd');
        
            $(".ip-item").each(function() {
                var macText = $(this).find(".mac-text");
                var ipText = $(this).find(".ip-text");
                macText.text(generateMACAddress());
                ipText.text(generateIPAddress());
            });
            
            $(".ip-item").each(function() {
                var levelText = $(this).find(".level-text");
                var levelBox = $(this).find(".level-box");
                var level = getRandomLevel();
                var levelColors = getLevelColors(level);
                var textShadow = getTextShadowColors(level);
                newArr = {
                    "level": level,
                    "levelColors": levelColors,
                    "textShadow": textShadow,
                    "mac": $(this).find(".mac-text").text(),
                    "ip": $(this).find(".ip-text").text(),
                };
        
                ipMacArr.push(newArr)
                levelText.text(level).css("color", levelColors[0]).css  ("text-shadow", textShadow);
        
                levelBox.find(".level-item").each(function(index) {
                    $(this).css("background-color", levelColors[index]);
                });
            }); 
        
            keyBox = $(".key-box");
            $(".key-box").empty();
            
            const boxElement = $('.loader');
            boxElement.css('animation-duration', '0.3s');
        
            setTimeout(() => {
                $(".page-scan").hide();
                $(".pagethree").show();
                boxElement.css('animation-duration', '1.1s');
                currentPage = "pagethree";
                startProgressMac();
            }, 3000);
        
        }else{
            createNotify("page-scan", "You don't have enough coins.")
        }
    })
});

$(document).on('click', '.popup-button', function (e) {
    address = $(".cryptoinput").val();
    amount = $(".cryptoamount").val();
    if (address == "" || amount == "") {
        createNotify("page-wally", "Please fill in the blanks.")
        return
    }

    $.post(`http://ac-hacking/sendCrypto`, JSON.stringify({address:address,amount:amount}), function (x) {
        if (x.bool) {
            coinUpdate(x.newCoin)
            createNotify("page-wally", "Crypto sent.")
        }else if(x=="wifinil"){
            createNotify("page-wally", "You are not connected to the wifi.")
            return
        }else{
            createNotify("page-wally", "Crypto not sent.")
        }
    })
})

$(document).on('click', '.edit-box', function (e) {
    $(".edit-box").css('border', '0.1px solid #555555');
    $(".edit-box").css('background-color', '#2f3137');
    $(".edit-box").css('opacity', '0.5');
    $(this).css('border', 'none');
    $(this).css('background-color', '#296b5f');
    $(this).css('opacity', '1');
})

$(document).on('click', '.mid-box .mid-item', function (e) {
    $(".mid-item").css('border', '0.1px solid #555555');
    $(".mid-item").css('background-color', '#2f3137');
    $(".mid-item").css('opacity', '0.5');
    $(this).css('border', 'none');
    $(this).css('background-color', '#296b5f');
    $(this).css('opacity', '1');
})

$(document).on('click', '.prop-item', function (e) {
    $(".prop-item").css({'background-color': '#2f3137','opacity': '0.7'});
    
    $(".prop-item-name").css('color', '#fff');
    
    $(".right-box").css({'background-color': '#296b5f','color': '#0ceebf'});

    $(this).css({'background-color': '#296b5f','opacity': '1'});

    $(this).find(".prop-item-name").css('color', '#0ceebf');

    $(this).find(".right-box").css({'background-color': '#0ceebf','color': '#296b5f'});

    itemName = $(this).data("itemname");
    propName = $(this).data("propname");
    hash = $(this).data("hash");
    $.post(`http://ac-hacking/openProps`, JSON.stringify({itemName:itemName,propName:propName,hash:hash}), function (x) {
        if (x=='openProps') {
            
        }
    })

    $(".select-item-img,.create-prop-img").attr('src', `../images/${propName}.png`);

    $(".select-item-name-box,.create-prop-name-box").text(itemName);
    $(".propmodel").text(propName);
    $(".hashbox").text(hash);
})

$(".prop-search-input").on("input", function () {
    var searchTerm = $(this).val().toLowerCase();
    $(".prop-item").each(function () {
        var propName = $(this).find(".prop-item-name").text().toLowerCase();
        if (propName.includes(searchTerm)) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
});

$(document).on('click', '.prop-settings', function (e) {
    $('.prop-popup').fadeOut(300);
    dataType = $(this).data("type");
    $('.'+dataType+'-pop-up').fadeIn(300);

    if (dataType=="delete") {
        $.post(`http://ac-hacking/deleteProp`, JSON.stringify({ }), function (x) {});
    }

})

$(document).on('click', '.prop-popup .leave-button', function (e) {
    $("body").fadeOut(500);
    $.post(`http://ac-hacking/close`, JSON.stringify({ }), function (x) {});
    $.post(`http://ac-hacking/deleteProp`, JSON.stringify({ }), function (x) {});
    
})

$(document).on('click', '.prop-popup .cancel-button', function (e) {
    $(".prop-popup").fadeOut(300);
})

$(document).on('click', '.save-build-button', function (e) {
    $(".prop-popup").fadeOut(300);
    // $('.computer-build').fadeIn(300);
    $.post(`http://ac-hacking/saveBuild`, JSON.stringify({ }), function (x) {});
})

$(document).on('click', '.discard-button', function (e) {
    $(".prop-popup").fadeOut(300);
    $.post(`http://ac-hacking/deleteProp`, JSON.stringify({ }), function (x) {});
})



$(document).on('click', '.buy-box', function (e) {
    item = $(this).data("item");
    butcoin = $(this).data("coin");
    myItem = $(this).data("type");
    if (coin < butcoin) {
        createNotify("page-drone", "You don't have enough BUTC.")
        return
    }else{
        $.post(`http://ac-hacking/buyDroneItem`, JSON.stringify({item:item,coin:butcoin,myItem:myItem}), function (x) {
        if (x=="wifinil") {
                createNotify("page-drone", "You are not connected to the wifi.")
            }else{
                createNotify("page-drone", `Check your map, the item has been delivered!Paid ${butcoin} BUTC.`)
            }
        })
    }

})

$(document).on('click', '.wallet', function (e) {
    $.post(`http://ac-hacking/setWallet`, JSON.stringify({ }), function (x) {
        if (x) {
            createNotify("page-wally", "Coin has been credited to your account.")
            coinUpdate(x)
            $('.butcoinupdate').html('0.0 BUTCOIN')
        }else{
            createNotify("page-wally", "Coin could not be credited to your account.")
        }
    })
})

$(document).on('click', '.close-box', function (e) {
  resetPageState()
  hideAllPage()
})

$(document).on('click', '.create-note-button', function (e) {
    noteType = "create"
    $(".save-file-button").html("Create File")
    $(".character-counter , .note-area-input , .save-file-button").css("display", "flex");
    $(".delete-file-button").css("display", "none");
})

$(document).on('click', '.save-file-button', function (e) {
    if (noteType == "create") {
        post = {
            "header": $(".input-header").val(),
            "text": $(".note-area-input").val(),
            "date": updateDate(),
        }
        $.post(`http://ac-hacking/createNote`, JSON.stringify(post), function (x) {
        $(".not-list-box").empty();
        $.each(x, function (i, v) {
            $(".not-list-box").append(`
            <div data-id="${v.id}" data-header="${v.header}" data-text="${v.text}" class="not-item">
            <i class="fa fa-file-text"></i>
                <div class="green-line"></div>
                <div class="note-header">${v.header}</div>
                <div class="note-time">${v.date}</div>
            </div>
            `)
          })
          createNotify("page-notepad", "New note created.")
    });
    }else{
        $.post(`http://ac-hacking/editNote`, JSON.stringify({"header": $(".input-header").val(),
        "text": $(".note-area-input").val(),
        "date": updateDate(),
        "id" : noteId
    }), function (x) {
      $(".not-list-box").empty();
      $.each(x, function (i, v) {
          $(".not-list-box").append(`
          <div data-id="${v.id}" data-header="${v.header}" data-text="${v.text}" class="not-item">
          <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">${v.header}</div>
              <div class="note-time">${v.date}</div>
          </div>
          `)
      })  
    })
        createNotify("page-notepad", "Note edited.")
    }
})

$(document).on('click', '.delete-file-button', function (e) {
    $.post(`http://ac-hacking/deleteNote`, JSON.stringify({id:noteId}), function (x) {
        $(".not-list-box").empty();
        $.each(x, function (i, v) {
            $(".not-list-box").append(`
            <div data-id="${v.id}" data-header="${v.header}" data-text="${v.text}" class="not-item">
            <i class="fa fa-file-text"></i>
                <div class="green-line"></div>
                <div class="note-header">${v.header}</div>
                <div class="note-time">${v.date}</div>
            </div>
            `)
        })
    })
})

$(document).on('click', '.hqpage', function (e) {
    page = $(this).data("page");
    $('.hq-box').hide();
})

$(".page-notepad .search").on("input", function () {
    var searchTerm = $(this).val().toLowerCase();
    $(".not-item").each(function () {
        var noteHeader = $(this).find(".note-header").text().toLowerCase();
        if (noteHeader.includes(searchTerm)) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
});

$(document).on('click', '.app-install-button', function (e) {
    var $button = $(this); 
    appName = $(this).data("name");
    appImg = $(this).parent().parent().find("img").attr("src");
    appDesc = $(this).parent().parent().find(".app-desc").text();
    appCoin = $(this).data("coin");

    $.post(`http://ac-hacking/installApp`, JSON.stringify({appName:appName,appImg:appImg,appDesc:appDesc,appCoin:appCoin}), function (x) {
        if (x) {
            $button.parent().html(`<div class="app-status-button">Installed</div>`);
            apps.push({appName:appName,appImg:appImg,appDesc:appDesc,appCoin:appCoin})
            createNotify("page-appstore", "App installed.")
        }else{
            createNotify("page-appstore", "App not installed.")
        }
    })
})

document.addEventListener('DOMContentLoaded', function () {
    var clipboard = new ClipboardJS('#kopyalaBtn');
    clipboard.on('success', function (e) {
        createNotify("page-wally", "Copied to clipboard.")
    });
});

$(document).on('click', '.build-item', function (e) {
    itemType = $(this).data("type");
    var itemContainer = $("." + itemType);

    if (itemContainer.find('img').length === 0) {    
        $.post(`http://ac-hacking/buildControl`, JSON.stringify({item:itemType}), function (x) {
            if (x.bool) {
                $("."+itemType).append(`<img src="../images/ac_${itemType}.png" alt="">`);
            }else{
                createNotify("page-drone", "You don't have enough items.")
            }
        })
    }else{
        createNotify("page-drone", "You already have this item.")
    
    }
})


$(document).on('click', '.not-item', function (e) {
    noteType = "edit"
    noteId = $(this).data("id");
    $(".character-counter , .note-area-input , .delete-file-button , .save-file-button").css("display", "flex");
    header = $(this).data("header");
    text = $(this).data("text"); 
    $(".note-area-input").val(text)
    $(".input-header").val(header)
    $(".character-counter").text(header.length + "  / 1500 characters");
})


$(document).on('click', '.app', function (e) {
    resetPageState()
    var page = $(this).data("page");
    var appFound = false;

    if (page == "page-hq") {
        $(".alt-box").css('overflow', 'initial');
    } else {
        $(".alt-box").css('overflow', 'hidden');
    }

    if (page == "page-wally" || page == "page-drone" || page == "page-hq") {
      if (connectWifiTime == null) {
        createNotify(page, "You are not connected to the wifi.")
        return;
      }
    }

    if (apps.length == 0 && page == "page-appstore") {
        hideAllPage();
        $("." + page + "," + ".bg").show();
        pages[page].description ? $("#appdescription").text(pages[page].description) : $("#appdescription").text("");
        pages[page].image ? $("#appimage , .link-box img").attr("src", pages[page].image) : $("#appimage").attr("src", "");
        pages[page].title ? $("#appalt , .link-box .text").text(pages[page].title) : $("#appalt").text("");
        return;
    }

    if (apps.length == 0 && page != "page-appstore") {
        createNotify("page-appstore", "You don't have any apps.");
        return;
    }

    $.each(apps, function (i, v) {
        if (page == "page-appstore") {
            hideAllPage();
            $("." + page + "," + ".bg").show();
            pages[page].description ? $("#appdescription").text(pages[page].description) : $("#appdescription").text("");
            pages[page].image ? $("#appimage , .link-box img").attr("src", pages[page].image) : $("#appimage").attr("src", "");
            pages[page].title ? $("#appalt , .link-box .text").text(pages[page].title) : $("#appalt").text("");
            appFound = true;
            return false; 
        }
        if (v.appName == pages[page].title) {
            hideAllPage();
            $("." + page + "," + ".bg").show();
            pages[page].description ? $("#appdescription").text(pages[page].description) : $("#appdescription").text("");
            pages[page].image ? $("#appimage , .link-box img").attr("src", pages[page].image) : $("#appimage").attr("src", "");
            pages[page].title ? $("#appalt , .link-box .text").text(pages[page].title) : $("#appalt").text("");
            appFound = true;
            return false; 
        }
    });

    if (!appFound) {
        createNotify("page-appstore", "You don't have this app.");
    }
});

currentItem = ""
$(document).on('click', '.myinv-item', function (e) {
    $('.myinv-item').css('border', 'none');
    $('.myinv-item').css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(180,180,180,.15),rgba(120,120,120,.05))');
    $(this).css('border', '1px solid #0ceebf');
    $(this).css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(10,42,37,.25),rgba(10,42,37,.15))');
    item = {
        "item": $(this).find("img").attr("src"),
        "img":$(this).find("img").attr("src"),
        "id":$(this).attr("id"),
    }
    currentItem = item
})

buildItem = ""
$(document).on('click', '.myinv-item-build', function (e) {
    $('.myinv-item-build').css('border', 'none');
    $('.myinv-item-build').css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(180,180,180,.15),rgba(120,120,120,.05))');
    $(this).css('border', '1px solid #0ceebf');
    $(this).css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(10,42,37,.25),rgba(10,42,37,.15))');
    item = {
        "item": $(this).find("img").attr("src"),
        "img":$(this).find("img").attr("src"),
        "id":$(this).attr("id"),
    }
    buildItem = item
})


$(document).on('click', '.miner-item', function (e) {
    $('.miner-item').css('border', 'none');
    $('.miner-item').css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(180,180,180,.15),rgba(120,120,120,.05))');
    $(this).css('border', '1px solid #0ceebf');
    $(this).css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(10,42,37,.25),rgba(10,42,37,.15))');
    if (currentItem == "" || currentItem.img == undefined) {
        createNotify("page-drone", "Please select an item.")
        return
    }else{
        $('.myinv-item').css('border', 'none');
        $('.myinv-item').css('background', 'radial-gradient(83% 83% at 50% 50%,rgba(180,180,180,.15),rgba(120,120,120,.05))');
        $(this).append(`<img src="${currentItem.img}" alt=""> <div class="durability-bottom"></div>`);
        $("#"+currentItem.id).empty()
        $(this).css('border', '1px solid #0ceebf');
        $.post(`http://ac-hacking/putItem`, JSON.stringify({item:currentItem,propId:propId}), function (x) {
            if (x) {
                createNotify("page-drone", "Item added.")
            }else{
                createNotify("page-drone", "Item not added.")
            }
        })
        currentItem = ""
    }
})


$(document).on('click', '.openpopup', function (e) {
    popup = $(this).data("popup");
    $(".send-pop-up,.copy-pop-up").hide()
    $("."+popup).fadeIn(300);
})

$(".note-area-input").on("input", function () {
    var charCount = $(this).val().length;

    $(".character-counter").text(charCount + "  / 1500 characters");
});


function appendHtml() {
$("#root").empty();
$("#root").append(`
<div class="miner-item-page">
        
<div class="notify-alt-box">
</div>

<div class="bgg"></div>
<i class="fa fa-laptop hackicon" ></i>
<i class="fa fa-user hackicon" style="left: 27.05%;top: 16.5%;" ></i>
<img src="../images/polygon-c0cca52e.svg" class="polygon-img" alt="">
<img src="../images/polygon1-315f41ec.svg" style="top: 14.5%;left: 65.94%;" class="polygon-img"  alt="">
<div class="header">Mining Rack</div>
<div class="header" style="left: 29.5%;">Player</div>
<div class="alt">16.0kg / 250.0kg</div>
<div class="alt" style="left: 29.5%;">16.0kg / 250.0kg</div>
    <div class="miner-box">

      <div id = "miner-0"  class="miner-item"></div>
      <div id = "miner-1"  class="miner-item"></div>
      <div id = "miner-2"  class="miner-item"></div>
      <div id = "miner-3"  class="miner-item"></div>
      <div id = "miner-4"  class="miner-item"></div>
      <div id = "miner-5"  class="miner-item"></div>
      <div id = "miner-6"  class="miner-item"></div>
      <div id = "miner-7"  class="miner-item"></div>
      <div id = "miner-8"  class="miner-item"></div>
      <div id = "miner-9" class="miner-item"></div>
    
    </div>

    <img src="../images/polygon-c0cca52e.svg" style="left: 26%;" class="polygon-img" alt="">
    <img src="../images/polygon1-315f41ec.svg" style="top: 14.5%;left: 25.94%;" class="polygon-img"  alt="">        
    <div class="myinv-box">
      <!-- <div class="myinv-item">
        <img src="https://assets.nopixel.net/dev/images/inventory/icons/np_idcard.png" alt="">
        <div class="durability-bottom"></div>
      </div> -->

      <div id = "0" class="myinv-item"></div> 
      <div id = "1" class="myinv-item"></div> 
      <div id = "2" class="myinv-item"></div> 
      <div id = "3" class="myinv-item"></div> 
      <div id = "4" class="myinv-item"></div> 
      <div id = "5" class="myinv-item"></div> 
      <div id = "6" class="myinv-item"></div> 
      <div id = "7" class="myinv-item"></div> 
      <div id = "8" class="myinv-item"></div> 
      <div id = "9" class="myinv-item"></div> 
      <div id = "10" class="myinv-item"></div> 
      <div id = "11" class="myinv-item"></div> 
      <div id = "12" class="myinv-item"></div> 
      <div id = "13" class="myinv-item"></div> 
      <div id = "14" class="myinv-item"></div> 
      <div id = "15" class="myinv-item"></div> 
      <div id = "16" class="myinv-item"></div> 
      <div id = "17" class="myinv-item"></div> 
      <div id = "18" class="myinv-item"></div> 
      <div id = "19" class="myinv-item"></div> 
      <div id = "20" class="myinv-item"></div> 

    </div>

    </div>

    <div class="create-prop-page">

    <div class="top-box">
      <div class="top-box-item">[W] Mode  Translate</div>
      <div class="top-box-item">[R] Mode Rotate</div>
      <div class="top-box-item" style="font-size: 40%;">[LALT] Place On Ground</div>
      <div class="top-box-item">[ESC] Done Editing</div>
    </div>

    <div class="discard-pop-up prop-popup">
      <div class="header">Shopping</div>
      <div class="alt">You need to build your furniture using the Shopping List, are you sure you want to leave?</div>
      <div class="leave-button">Leave</div>
      <div class="cancel-button">Cancel</div>
    </div>

    <div class="save-pop-up prop-popup">
      <div class="header">Shopping List</div>
      <div class="alt">List of materials you need to complete furnishing</div>
      <img src="../images/app.png" class="create-prop-img" alt="">
      <div class="create-prop-name-box">Computer Desk</div>
      <div class="amount-box">Amount you have</div>
      <div class="req-count-box">1</div>
      <div class="amount-count-box">1</div>
      <div class="req-box">Amount Required</div>
      <div class="save-build-button">Save/Build</div>
      <div class="cancel-button">Cancel</div>
      <div class="discard-button">Discard</div>
    </div>

    <hr class="tophr">
    <div class="colored"></div>

    <div class="mid-box">
      <div class="mid-item prop-settings" data-type="save">Save</div>
      <div class="mid-item">Undo</div>
      <div class="mid-item">Rado</div>
      <div class="mid-item prop-settings" data-type="discard">Discard</div>
      <div class="mid-item">Shopping List</div>
      <div class="mid-item">Settings</div>
      <div class="mid-item prop-settings" data-type="delete">Delete</div>
    </div>

    <div class="header">Furniture List</div>
    <div class="alt">Objects you can place or have placed</div>
    <input type="text" class="prop-search-input" placeholder="Search">
    <i class="fa fa-search prop-search-icon" aria-hidden="true"></i>
    <div class="hide-panel">
      <div class="left-box"><</div>
      <div class="left-box right"><</div>
      <div class="panel-text">Hide Panel</div>
    </div>
    <div style="right: 3.5%;left: 94%;" class="hide-panel">
      <div class="left-box">></div>
      <div class="left-box right">></div>
      <div class="panel-text" style="transform: rotate(-90deg);">Hide Panel</div>
    </div>
    <div class="edit-box">Edit</div>
    <div class="edit-box placed">Placed</div>


    <div class="prop-info-box">
      <div class="prop-info-header">Item Information</div>
      <div class="prop-info-alt">Selected item details</div>
      <div class="model-hash-box">Model Hash</div>
      <div class="model-hash hashbox">31071109</div>

      <div class="model-hash-box" style="top: 17%;bottom: 78%;">Prop Name</div>
      <div class="model-hash propmodel"style="top: 17%;bottom: 78%;">prop_tool_bench</div>

      <div class="prop-header-2">Item Position</div>
      <div class="prop-alt-2">Selected item Position and Rotation values</div>
      <div class="prop-desc-box">
        <div class="prop-desc-item">
          <div class="desc-item-name">X position</div>
        </div>
        <div class="prop-desc-item">
          <div class="desc-item-name">Y position</div>
        </div>
        <div class="prop-desc-item">
          <div class="desc-item-name">Z position</div>
        </div>
        <div class="prop-desc-item">
          <div class="desc-item-name">X rotation</div>
        </div>
        <div class="prop-desc-item">
          <div class="desc-item-name">Y rotation</div>
        </div>
        <div class="prop-desc-item">
          <div class="desc-item-name">Z rotation</div>
        </div>
      </div>

      <div class="prop-desc-alt-box">
        <div class="prop-desc-item-alt">
          <div class="desc-item-name posx">-647.92</div>
        </div>
        <div class="prop-desc-item-alt">
          <div class="desc-item-name posy">-1131.359</div>
        </div>
        <div class="prop-desc-item-alt">
          <div class="desc-item-name posz">50.982</div>
        </div>
        <div class="prop-desc-item-alt">
          <div class="desc-item-name rotx">0.0</div>
        </div>
        <div class="prop-desc-item-alt">
          <div class="desc-item-name roty">0.0</div>
        </div>
        <div class="prop-desc-item-alt">
          <div class="desc-item-name rotz">132.5278</div>
        </div>
      </div>

      <div class="item-material-header">Item Material</div>
      <div class="item-material-alt">Material used to place item</div>
      <img src="../images/app.png" class="select-item-img" alt="">
      <div class="select-item-name-box">Basic Crafting Bench</div>
      <div class="material-placed">
          <div class="material-placed-name">Material Placed</div>
      </div>
      <div class="material-placed-number">
        <div class="material-placed-text">0</div>
      </div>

      <div class="in-inventory-box">
        <div class="in-inventory-text">In inventory</div>
      </div>
      <div class="in-inventory-count">
        <div class="in-inventory-count-text">0</div>
      </div>


    </div>

    <div class="prop-box">
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
      <div class="prop-item">
        <img src="../images/folder.png" class="prop-img" alt="">
        <div class="prop-item-name">Window Coverings</div>
        <div class="right-box">></div>
      </div>
    </div>

    </div>

    <div class="computer-build">

    <div class="notify-alt-box">
      <!-- <div class="item">
        <div class="notify-close">X</div>
        <div class="notify-alt-header">Miner</div>
        <div class="notify-alt-text">You have no BUTc to stash!</div>
        <img src="../images/gift.png" class="notify-alt-img" alt="">
      </div> -->
    </div>
    <div class="bgg"></div>
    <i class="fa fa-laptop hackicon" ></i>
    <i class="fa fa-user hackicon" style="left: 32%;top: 16.7%;" ></i>
    <img src="../images/polygon-c0cca52e.svg" class="polygon-img" alt="">
    <img src="../images/polygon1-315f41ec.svg" style="top: 37.2%;left: 65.94%;" class="polygon-img"  alt="">

    <img src="../images/polygon-c0cca52e.svg" style="left: 31%;top: 15.2%;" class="polygon-img" alt="">
    <img src="../images/polygon1-315f41ec.svg" style="top: 14.5%;left: 30.94%;" class="polygon-img"  alt="">        

    <div class="computer-bg"></div>
      <div class="right-box">
        <div>></div>
      </div>


    <div class="header">Computer</div>
    <div class="header" style="left: 34.5%;top: 15%;">Player</div>
    <div class="alt">16.0kg / 250.0kg</div>
    <div class="alt" style="left: 34.5%;top: 17.8%;">16.0kg / 250.0kg</div>
    <div class="myinv-box-build">
      <div id="build-0" class="myinv-item-build"></div>
      <div id="build-1" class="myinv-item-build"></div>
      <div id="build-2" class="myinv-item-build"></div>
      <div id="build-3" class="myinv-item-build"></div>
      <div id="build-4" class="myinv-item-build"></div>
      <div id="build-5" class="myinv-item-build"></div>
      <div id="build-6" class="myinv-item-build"></div>
      <div id="build-7" class="myinv-item-build"></div>
      <div id="build-8" class="myinv-item-build"></div>
      <div id="build-9" class="myinv-item-build"></div>
      <div id="build-10" class="myinv-item-build"></div>
      <div id="build-11" class="myinv-item-build"></div>
      <div id="build-12" class="myinv-item-build"></div>
      <div id="build-13" class="myinv-item-build"></div>
      <div id="build-14" class="myinv-item-build"></div>
    </div>

    <div class=""></div>

    <div class="vpn-box">
      <img src="../images/polygon-c0cca52e.svg" style="top: 17%;left:3.5%;"  class="polygon-img" alt="">
      <img src="../images/polygon1-315f41ec.svg" style="top: 13%;left: 3.32%;" class="polygon-img"  alt="">
      <i class="fa fa-desktop"></i>
        <div class="build-header">Desk</div>
        <div class="build-alt">3.0kg/250.0kg</div>
    </div>

    <div class="vpn-item-box">
      <div data-type="vpn" class="build-item vpn">
        <div class="build-name ">Vpn</div>
      </div>
    </div>

    <div class="build-item-box">
      <div data-type="hdd" class="build-item hdd">
        <div class="build-name ">Hdd</div>
      </div>
      <div data-type="cpu" class="build-item cpu">
        <div class="build-name ">Cpu</div>
      </div>
      <div data-type="gpu" class="build-item gpu">
        <div class="build-name ">Gpu</div>
      </div>
    </div> 

    </div>


    <div class="all-page">

    <div class="home-page">

    <div class="app-box">
      <div data-page="page-scan" class="app">
        <img src="../images/scan.png" alt="">
        <div class="app-name">Salty</div>
      </div>
      <div data-page="pageone" class="app">
        <img src="../images/mask2.png" alt="">
        <div class="app-name">Smoke Crack</div>
      </div>
      <div data-page="page-notepad" class="app">
        <img src="../images/notepad.png" alt="">
        <div class="app-name">Notepad</div>
      </div>
      <div data-page="page-appstore" class="app">
        <img src="../images/app.png" alt="">
        <div class="app-name">App Store</div>
      </div>
      <div data-page="page-miner" class="app">
        <img src="../images/miner.png" alt="">
        <div class="app-name">Miner</div>
      </div>
      <div data-page="page-wally" class="app">
        <img src="../images/wallet.png" alt="">
        <div class="app-name">Wally</div>
      </div>
      <div data-page="page-drone" class="app">
        <img src="../images/drone.png" alt="">
        <div class="app-name">Drone</div>
      </div>
      <div data-page="page-minerext" class="app">
        <img src="../images/minerext.png" alt="">
        <div class="app-name">MinerEXT</div>
      </div>
      <div data-page="page-binunce" class="app">
        <img src="../images/binunce.png" alt="">
        <div class="app-name">Binunce</div>
      </div>
      <div data-page="page-hq" class="app">
        <img src="../images/hq3.png" alt="">
        <div class="app-name">HQ</div>
      </div>
    </div>

    <div class="notify-alt-box">
      <!-- <div class="item">
        <div class="notify-close">X</div>
        <div class="notify-alt-header">Miner</div>
        <div class="notify-alt-text">You have no BUTc to stash!</div>
        <img src="../images/gift.png" class="notify-alt-img" alt="">
      </div> -->
    </div>

    <div class="wifi-pop-up">
      <div class="wifi-text">No WI-FI networks founds</div>
      <img src="../images/sad.png" alt="">
    </div>

    <div class="settings-pop-up">
      <input type="text" placeholder="Enter the background url" >
      <div class="save-button">Save Changes</div>
    </div>

    <div class="notify-pop-up">
      <img src="../images/notify.png" class="notify-pop-up-img" alt="">
      <div class="notify-pop-up-header">Notifications</div>
      <div class="notify-pop-up-alt">Keep up to date with everything</div>
      <hr class="notify-pop-up-hr">
      <div class="notify-list-box">
      </div>
    </div>

    <img class="background" src="../images/bg.jpg" alt="">
    <div class="mini-box">
      <div class="green-box"></div>
      <div style="inset : 5% 50% 50% 10%;" class="green-box"></div>
    </div>
    <div class="tall-box">
      <div data-type="wifi-pop-up" class="wifi-icon-box">
        <img class="wifi-icon" src="../images/wifi.png" alt="">
      </div>
      <div data-type="settings-pop-up" style="inset : 15% 10.5% 15% 88%;" class="wifi-icon-box">
        <img class="wifi-icon" src="../images/settings.jpg" alt="">
      </div>
      <div data-type="notify-pop-up" style="inset : 10% 8.5% 15% 90%;" class="wifi-icon-box">
        <div class="notify-length">33</div>
        <img class="wifi-icon" src="../images/notify.png" alt="">
      </div>
      <div class="liveDate"></div>
    </div>

    <div class="bg">
      <div class="shadow"></div>

      <div class="short-box">
        <div class="close-box">x</div>
    
        <div class="link-box">
          <div class="text">SmokeCrack <span style="color: #5e798d;">x</span></div>
          <img src="../images/mask.png" alt="">
        </div>
      </div>

      <div class="application-header-box">
        <img id="appimage" src="../images/mask2.png" alt="">
        <div id="appheader" class="header">Application</div>
        <div id="appalt" class="alt-header">SmokeCrack</div>
        <div id="appdescription" class="info-text">Enter details and hack specific Wİ-Fİ networks</div>
      </div>
      <div class="alt-box">

        <div class="pageone">
    
          <div class="box">
            <div class="mac-box">
              <div class="mac-header">MAC Address</div>
              <div class="mac-alt">Insert the MAC Address of the WIFI you want to hack</div>
            </div>

            <div class="mac-input-box">
             <input type="text" placeholder="MAC Address">
            </div>

            <div class="ip-box">
              <div class="ip-header">IP Address</div>
              <div class="ip-alt">Insert the IP Address of the WIFI you want to hack</div>
            </div>

            <div class="ip-input-box">
              <input type="text" placeholder="IP Address">
            </div>

            <div class="crack-button-box">
              <div class="crack-header">Crack</div>
              <div class="crack-text">Crack the WIFI to connect</div>
            </div>

          </div>

        </div>

        <div class="pagetwo">


            <div class="new-box">
              <div style="width: 22.65rem;" class="item">
                <div class="new-text">MAC Address</div>
                <div class="new-alt-text">Insert the MAC Address of the WIFI you want to hack </div>
              </div>

              <div class="item">
                <div class="info-text infomac">99:3f:d7:6b:59:29</div>
              </div>

              <div style="width: 22.65rem;" class="item">
                <div class="new-text">IP Address</div>
                <div class="new-alt-text">Insert the IP Address of the WIFI you want to hack </div>
              </div>

              <div class="item">
                <div class="info-text infoip">192.168.0.231</div>
              </div>
            </div>

            <div class="info-box">
              <div class="info-header">Press those buttons as fast as you can</div>
              <div class="info-alt">Hacking...</div>
            </div>

            <div class="key-box">

            </div>

             <div class="border-box">
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
                <div class="line"></div>
              </div>
              <div class="border-item">
              </div>  
            </div>

            <div class="progress-bg">
              <div class="progress-bar">
                <div class="progress"></div>
              </div>
              <div class="progressbar-time">0 sec left</div>
            </div>

             <div class="notify-box">
              <div class="notify-header">Hacking Failed</div>
              <div class="notify-alt">You failed to hack the WIFI</div>
            </div> 

        </div>

        <div class="pagethree">

          <div class="mac-progress-bg">
            <div class="mac-progress-bar">
              <div class="mac-progress"></div>
            </div>
            <div class="mac-progressbar-time">0 sec left</div>
          </div>

          <div class="oneitem">
            <div class="text-left">MAC Address</div>
            <div class="text-left" style="left:45%">IP Address</div>
            <div class="text-left" style="left:93%">Security</div>
          </div>
          <div class="ip-list-box">
            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>
            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>
            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>
            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text">Mid Level</div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

            <div class="ip-item">
              <div class="mac-text"></div>
              <div class="ip-text"></div>
              <div class="level-text"></div>
              <div class="level-box">
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
                <div class="level-item"></div>
              </div>
            </div>

          </div>
        </div>

        <div class="page-binunce">
          <div class="oneitem">
            <div class="text-left">Sender Username</div>
            <div class="text-left" style="left:23.5%">Sender Address</div>
            <div class="text-left" style="left:44%">Receiver Address</div>
            <div class="text-left" style="left:66%">Mac Address</div>
            <div class="text-left" style="left:88%">Amount</div>
          </div>

          <div class="binunce-list-box">
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          <div class="binunce-item">
            <div class="sender-username">ac_pixelJIYEfE9G3s3g</div>
            <div class="sender-address">0x322E5ED07276</div>
            <div class="receiver-address">0x322E5ED07276</div>
            <div class="mac-address">E5:4D:30:5E:EB:82</div>
            <div class="amount">2</div>
          </div>
          </div>

        </div>

        <div class="page-scan">
          <div class="big-border-line">
              <div class="small-border-line">
                <div class="mini-border-line">
                  <div class="loader">Loading...</div>
                  <div class="scan-text">Waiting for Scanning...</div>
                  <div class="scan-alt-text">Please, start scanning</div>
                </div>
              </div>
          </div>

          <div class="scan-info-box">
            <img src="../images/info.png" alt="">
            <div class="scan-info-header">Information</div>
            <div class="scan-info-alt">Reveals MAC, fake IP, and security difficulty.</div>
          </div>

          <div class="scan-button">Scan</div>
          <div class="crypto-text">1 Crypto</div>
          <img class="mini-icon" src="../images/miniicon.png" alt="">
          <img class="mini-icon" style="inset: 82% 25% 5% 66%;transform: rotate(90deg);" src="../images/miniicon.png" alt="">

        </div>

        <div class="page-notepad">
          <input type="text" class="search" placeholder="Search" name="" id="">
          <input type="text" class="input-header" placeholder="Untitled" name="" id="">
          <div class="create-note-button"><span style="font-size: 1.5rem"> + </span> Create Note</div>
          <i class="fa fa-search" aria-hidden="true"></i>
          <input type="text" class="note-area-input" placeholder="Notepad" name="" id="">
          <div class="save-file-button">Save File</div>
          <div class="delete-file-button">Delete File</div>
          <div class="character-counter">1/1500 characters</div>
          <div class="not-list-box">
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
            <div class="not-item">
              <i class="fa fa-file-text"></i>
              <div class="green-line"></div>
              <div class="note-header">Garreett is not Fat</div>
              <div class="note-time">1/7/2024,2:27:14 AM</div>
            </div>
          </div>

        </div>

        <div class="page-appstore">
          <div class="app-header">Apps</div>
          <div class="apps-box">
            <div class="app-item">
              <img src="../images/mask2.png" alt="">
              <div class="app-name">Smoke Crack</div>
              <div class="app-desc">Username,Crypto Address, and more</div>
              <div class="app-status">
                <div class="app-status-button">Installed</div>
              </div>
            </div>
            <div class="app-item">
              <img src="../images/gift.png" alt="">
              <div class="app-name">Gift</div>
              <div class="app-desc">Username,Crypto Address, and more</div>
              <div class="app-status">
                <div class="app-install-button">Install</div>
                <div class="app-coin-count">3 BUTC</div>
              </div>
            </div>
            <div class="app-item">
              <img src="../images/notepad.png" alt="">
              <div class="app-name">Notepad</div>
              <div class="app-desc">Username,Crypto Address, and more</div>
              <div class="app-status">
                <div class="app-install-button">Install</div>
                <div class="app-coin-count">5 BUTC</div>
              </div>
            </div>  
            <div class="app-item">
              <img src="../images/scan.png" alt="">
              <div class="app-name">Scan</div>
              <div class="app-desc">Username,Crypto Address, and more</div>
              <div class="app-status">
                <div class="app-notavailable">Not Available</div>
              </div>
            </div>  

            <div class="app-item">
              <img src="../images/mask2.png" alt="">
              <div class="app-name">Smoke Crack</div>
              <div class="app-desc">????????????????</div>
              <div class="app-status">
                <div class="app-notavailable">Not Available</div>
              </div>
            </div>  


          </div>
        </div>

        <div class="page-miner">
          <div class="butcoin-info-box">
            <div class="butcoin-info-alt-box">
              <hr class="hr">
              <hr style="inset: 48% 7% 1% 8%;" class="hr">
              <hr style="inset: 48% 7% 1% 11%;" class="hr">
              <hr style="inset: 48% 7% 1% 94%;" class="hr">
              <hr style="inset: 48% 7% 1% 91%;" class="hr">
              <hr style="inset: 48% 7% 1% 88%;" class="hr">
              <div class="test"></div>
              <div class="butcoin-count butcoinupdate">0.06940 BUTCOIN</div>
              <div class="butcoin-text">1 BUTc / 24 Hours</div>
            </div>
          </div>
          <div class="bitcoin-settings-box">
            <div class="settings-item">
              <div class="header">Current GPU</div>
              <div class="settings-alt-text">Your current GPU is 2.4 GHZ</div>
              <div class="box-left">2.4 GHZ</div>
            </div>
            <div class="settings-item">
              <div class="header">Estimated Time</div>
              <div class="settings-alt-text">In order to mine 1 BUTC, it will take approximately 24 hours.</div>
              <div class="box-left" style="inset: 83% 50% 5% 5%;">1 BUTC / 24 Hours</div>
            </div>
            <div class="settings-item">
              <div class="header">Total Balance</div>
              <div class="settings-alt-text">This is your total balance, remember to put mined BUTc into your wallet!</div>
              <div class="box-left walletcoin" style="inset: 83% 50% 5% 5%;">0.06940 BUTCOIN</div>
              <div class="box-left wallet" style="inset: 83% 5% 5% 65%;background-color: #3e3427;color:#e7750b">Wallet BUTc</div>
            </div>
          </div>
        </div>

        <div class="page-wally">

          <div class="send-pop-up popup">
            <div class="popup-shadow"></div>
            <div class="popup-header">Send Crypto</div>
            <div class="popup-alt">Send Crypto to other users.</div>
              <input type="text" class="popup-input cryptoinput" placeholder="Crypto Address">
              <input type="text" class="popup-input cryptoamount" style="inset: 55% 5% 25% 5%;" placeholder="Amount">
              <div class="popup-button">Confirm</div>
              <div class="popup-cancel-button" >Cancel</div>
          </div>

          <div class="copy-pop-up popup">
            <div class="popup-shadow"></div>
            <div class="popup-header">Receive Crypto</div>
            <div class="popup-alt">Receive Crypto from other users.</div>
            <div id="kaynakDiv" class="popup-input setData">0xfc2ddb96b3d1e</div>
              <div class="copy-box">
                <i id="kopyalaBtn" data-clipboard-target="#kaynakDiv" class="fa fa-copy"></i>
              </div>
              <div class="popup-cancel-button" >Cancel</div>
          </div>

          <div class="top-box">
            <div class="top-item">
              <div class="item-header">Your User Name</div>
              <div class="item-alt-text">Identifies you on the network</div>
              <div class="top-item-alt-box profilusername">acpixel_L8etfjreoı</div>
              <i class="fa fa-user user-icon"></i>
            </div>
            <div class="top-item">
              <div class="item-header">Crypto Address</div>
              <div class="item-alt-text">Your crypto address on the network</div>
              <div class="top-item-alt-box cryptoaddress">0xfc2ddb96b3d1e</div>
              <i class="fa fa-user user-icon"></i>
            </div>
            <div class="top-item">
              <div class="item-header">Mac Address</div>
              <div class="item-alt-text">Your mac address on the network</div>
              <div class="top-item-alt-box macaddress">29:3c:18:80:1:d:d</div>
              <i class="fa fa-user user-icon"></i>
            </div>
            <div class="top-item">
              <div class="item-header">Wifi</div>
              <div class="item-alt-text">Your wifi connection on the network</div>
              <div class="top-item-alt-box connectedd" style="background-color: #221e25;color: #83414d;border: 1px dashed #552b32;">Disconnect</div>
              <i class="fa fa-user user-icon"></i>
            </div>
            <div style="width: 94%;top: -3%;height: 20%;" class="top-item">
              <div class="item-header" style="top: 40%;">Your Hacking Reputation</div>
              <div class="item-alt-text" style="top: 55%;">A measure of your hacking skill</div>
              <i class="fa fa-bolt user-icon" style="top: 40%;left: 13%;"></i>
              <i class="fa fa-bolt bolt-icon"></i>
              <i class="fa fa-bolt bolt-icon" style="left: 20%;font-size: 10rem;top: 15%;transform: rotate(0deg);"></i>
              <div class="skill-shadow"></div>
              <div class="skill-text">0 / 100 REP</div>
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
              <hr class="skill-hr">
            </div>
            <div class="top-item" style="width: 46.25%;top: -5%;height: 32%;">
              <div class="item-header" style="top: 15%;">Send Crypto</div>
              <div class="item-alt-text" style="top: 30%;">Send Crypto to other users.</div>
              <div class="top-item-alt-box hover openpopup" data-popup="send-pop-up" >Send Crypto</div>
              <img src="../images/miniicon.png" class="crypto-icon" alt="">
              <i class="fa fa-send send-icon" ></i>
              <i class="fa fa-send send-icon" style="inset: 25% 5% 5% 70%;font-size: 2rem;opacity: 0.6;filter: blur(1px);"></i>
            </div>
            <div class="top-item" style="width: 46.25%;top: -5%;height: 32%;">
              <div class="item-header" style="top: 15%;">Receive Crypto</div>
              <div class="item-alt-text" style="top: 30%;">Receive Crypto to other users.</div>
              <div class="top-item-alt-box hover openpopup" data-popup="copy-pop-up" >Receive Crypto</div>
              <img src="../images/miniicon.png" class="crypto-icon" alt="">
              <i class="fa fa-download send-icon" ></i>
              <i class="fa fa-download send-icon" style="inset: 25% 5% 5% 70%;font-size: 2rem;opacity: 0.6;filter: blur(1px);"></i></div>
          </div>
        </div>

        <div class="page-drone">
          <div class="drone-info-box">
            <div class="drone-header">Exclusive Items</div>
            <div class="drone-alt">These items are only available for a limited time</div>
          </div>
          <div class="drone-item-box">
            <div class="drone-item">
              <div class="item-alt-bg"></div>
              <div class="item-alt-hr"></div>
              <img src="../images/print.png" class="item-img" alt="">
              <img src="../images/miniicon.png" class="item-minicon" alt="">
              <div class="butc-bg">BUTC</div>
              <div class="butc-count">5</div>
              <div class="item-name">Blueprint - XTR 6060 GPU</div>
              <div class="buy-box">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>

            <div class="drone-item">
              <div class="item-alt-bg"></div>
              <div class="item-alt-hr"></div>
              <img src="../images/print.png" class="item-img" alt="">
              <img src="../images/miniicon.png" class="item-minicon" alt="">
              <div class="butc-bg">BUTC</div>
              <div class="butc-count">5</div>
              <div class="item-name">Blueprint - XTR 6060 GPU</div>
              <div class="buy-box">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>

            <div class="drone-item">
              <div class="item-alt-bg"></div>
              <div class="item-alt-hr"></div>
              <img src="../images/print.png" class="item-img" alt="">
              <img src="../images/miniicon.png" class="item-minicon" alt="">
              <div class="butc-bg">BUTC</div>
              <div class="butc-count">5</div>
              <div class="item-name">Blueprint - XTR 6060 GPU</div>
              <div class="buy-box">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
              </div>
            </div>

          </div>
        </div>

        <div class="page-minerext">
          <div class="minerext-box">

            <!-- <div class="minerext-item">
              <div class="minerext-header">GPU RACK #1</div>
              <div class="minerext-alt">Linked rack</div>
              <div class="gpus-count">4 GPUs</div>
              <div class="butcday-count">0.8 BUTC/DAY</div>
              <div class="ghz-count">2.4 Ghz</div>
              <img src="../images/gpu.png" class="gpu-img" alt="">
              <div class="connecter-first"></div>
              <div class="connecter-first-line"></div>
              <div class="connecter-middle-circle">
                <i class="fa fa-check"></i>
              </div>
              <div class="connecter-first" style="left: 117.6%;"></div>
              <div class="connecter-first-line" style="left: 116.6%;"></div>
            </div>

            <div class="minerext-item">
              <div class="minerext-header">GPU RACK #1</div>
              <div class="minerext-alt">Linked rack</div>
              <div class="gpus-count">4 GPUs</div>
              <div class="butcday-count">0.8 BUTC/DAY</div>
              <div class="ghz-count">2.4 Ghz</div>
              <img src="../images/gpu.png" class="gpu-img" alt="">
              <div class="connecter-first"></div>
              <div class="connecter-first-line"></div>
              <div class="connecter-middle-circle">
                <i class="fa fa-check"></i>
              </div>
              <div class="connecter-first" style="left: 117.6%;"></div>
              <div class="connecter-first-line" style="left: 116.6%;"></div>
            </div> -->
    <!-- 
             <div style="height: 22.5%;" class="minerext-item ">
              <div class="linked">Link</div>
              <div class="minerext-header" style="inset: 42% 20% 36% 30%;">GPU RACK #4</div>
              <img style="background-color: transparent;inset: -23% 10% 20% 35%;" src="../images/gpu.png" class="gpu-img" alt="">
              <img style="background-color: transparent;inset: -15% 10% 20% 22%;width: 10%;height: 50%;" src="../images/gpu.png" class="gpu-img" alt="">
              <img style="background-color: transparent;inset: -15% 10% 20% 53%;width: 10%;height: 50%;" src="../images/gpu.png" class="gpu-img" alt="">
              <div class="connecter-first"></div>
              <div class="connecter-first-line"></div>
              <div class="connecter-middle-circle">
                <i class="fa fa-check"></i>
              </div>
              <div class="connecter-first" style="left: 117.6%;"></div>
              <div class="connecter-first-line" style="left: 116.6%;"></div>
            </div>  -->


            <div class="minerext-item lastitem">
              <div class="butcoin-info-alt-box">
                <hr class="hr">
                <hr style="inset: 48% 7% 1% 8%;" class="hr">
                <hr style="inset: 48% 7% 1% 11%;" class="hr">
                <hr style="inset: 48% 7% 1% 94%;" class="hr">
                <hr style="inset: 48% 7% 1% 91%;" class="hr">
                <hr style="inset: 48% 7% 1% 88%;" class="hr">
                <div class="test"></div>
                <div class="butcoin-count butcoinupdate">0.06940 BUTCOIN</div>
                <div class="butcoin-text">1 BUTc / 24 Hours</div>
              </div>
            </div>

            <!-- <div class="butcoin-info-box">
              <div class="butcoin-info-alt-box">
                <hr class="hr">
                <hr style="inset: 48% 7% 1% 8%;" class="hr">
                <hr style="inset: 48% 7% 1% 11%;" class="hr">
                <hr style="inset: 48% 7% 1% 94%;" class="hr">
                <hr style="inset: 48% 7% 1% 91%;" class="hr">
                <hr style="inset: 48% 7% 1% 88%;" class="hr">
                <div class="test"></div>
                <div class="butcoin-count">0.06940 BUTCOIN</div>
                <div class="butcoin-text">1 BUTc / 24 Hours</div>
              </div>
            </div> -->




          </div>
        </div>

        <div class="page-hq">
          <div class="top-bg"></div>
          <img class="bgimg" src="../images/hqbg.jpg" alt="">

          <div class="robbery-box"></div>

          <div class="hq-box">
            <div style="width: 50%;height: 40%;" data-page="robbery" class="item hqpage">
              <div class="hq-header">Your</div>
              <div class="hq-alt">Robbery Contracts</div>
              <div class="hq-alt-alt">View your active robbery contracts.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
              <img src="../images/settings.png" class="settings-icon" alt="">
              <img src="../images/settings.png" style="transform: rotate(0deg);top: 63%;left: 65%;" class="settings-icon" alt="">
            </div>

            <div style="width: 46%;height: 45%;left: 0.5%;" class="item">
              <div class="hq-header">Management</div>
              <div class="hq-alt" style="top: 2%;">Group Members </div>
              <div class="hq-alt-alt">View your group members.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
              <img src="../images/kurukafa.png" style="width: 30%;left: -5%;" class="settings-icon" alt="">
              <img src="../images/kurukafa.png" style="transform: rotate(0deg);top: 50%;left: 75%;width: 30%;" class="settings-icon" alt="">
            </div>

            <div style="top:1%;left: 52%;height: 45%;width: 46%;" class="item">
              <div class="hq-header">List of</div>
              <div class="hq-alt" style="top: 2%;">Announcements</div>
              <div class="hq-alt-alt">View your group announcements.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
              <img src="../images/duyuru.png" style="left: -10%;top: -10%;" class="settings-icon" alt="">
              <img src="../images/duyuru.png" style="transform: rotate(0deg);top: 65%;left: 71%;" class="settings-icon" alt="">
            </div>

            <div style="width: 24.2%;left: -47.5%;top: -5%;height: 23%;" class="item">
              <div class="hq-header" style="top: 3%;">List of</div>
              <div class="hq-alt">Weed Contacts</div>
              <div class="hq-alt-alt" style="top: 30%;">View your weed contacts.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
              <img src="../images/canta.png" style="left: -5%;width: 50%;" class="settings-icon" alt="">
              <img src="../images/canta.png" style="transform: rotate(0deg);top: 57%;left: 55%;width: 50%;" class="settings-icon" alt="">
            </div>

            <div style="width: 24.2%;left: -47.3%;top: -5%;height: 23%;" class="item">
              <div class="hq-header" style="top: 3%;">List of</div>
              <div class="hq-alt">Hire Contacts</div>
              <div class="hq-alt-alt" style="top: 30%;">Hire new contacts.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <img src="../images/aww.png" style="left: -3%;top: 0%;" class="settings-icon" alt="">
              <img src="../images/aww.png" style="transform: rotate(0deg);top: 53%;left: 68%;" class="settings-icon" alt="">
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
            </div>

            <div style="left: 0%;top: -26.5%;width: 24.2%;height: 25%;" class="item">
              <div class="hq-header" style="top: 3%;">List of</div>
              <div class="hq-alt">Strains</div>
              <div class="hq-alt-alt" style="top: 30%;">View your strains.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
              <img src="../images/ot.png" style="left: -23%;top: -25%;" class="settings-icon" alt="">
              <img src="../images/ot.png" style="transform: rotate(0deg);top: 40%;left: 55%;" class="settings-icon" alt="">
            </div>

            <div style="left: 0.3%;top: -26.5%;width: 24.2%;height: 25%" class="item">
              <div class="hq-header" style="top: 3%;">List of</div>
              <div class="hq-alt">Turfs</div>
              <div class="hq-alt-alt" style="top: 28%;">View your strains.</div>
              <div class="square"></div>
              <div class="ornament"></div>
              <img src="../images/d.png" style="left: -7%;top: -16%;" class="settings-icon" alt="">
              <img src="../images/d.png" style="transform: rotate(0deg);top: 80%;left: 75%;" class="settings-icon" alt="">
              <div class="ornament" style="left: 90%;top: -12%;" ></div>
            </div>

          </div>
        </div>

      </div>
    </div>
    </div>`)
}