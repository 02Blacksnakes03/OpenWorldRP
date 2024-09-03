
AC = {
    ServerCallbacks = {},
    UserNameStartLetter = "ac_pixel", --is the initial value of character names. you can type your server name here
    HackText = "Access Computer", --Articles about texts are written here
    BuildText = "Open Desk", --Articles about texts are written here
    MinerText = "Open Mining Rack", --Articles about texts are written here
    DroneObject = "ch_prop_casino_drone_02a", --You can use any drone you want by renaming it with other drones in the stream file
    ScanCoin = 1, --the amount of coins that will be deducted from players when you search
    MinerDistance = 30.0, --The distance value is how close to the computer you want the miner to be when you install it.
    BuildItemName = {
        ["gpu"] = {
            itemName = "ac_gpu",
            itemImg = "ac_gpu"
        },
        ["cpu"] = {
            itemName = "ac_cpu",
            itemImg = "ac_cpu"
        },
        ["hdd"] = {
            itemName = "ac_hdd",
            itemImg = "ac_hdd"
        },
        ["vpn"] = {
            itemName = "ac_vpn",
            itemImg = "ac_vpn"
        }
    },

    Notify = {
        ["pcControl"] = {
            msgType = "error",
            text = "Bilgisayar varken eklenecek item bilgisayar olmamalidir",
            length = 5000
        },
        ["minerControl"] = {
            msgType = "error",
            text = "Miner eklemek için bilgisayara yakin ol",
            length = 5000
        },
        ["minerSuccess"] = {
            msgType = "error",
            text = "Bilgisayara yakin oldugunuz icin eklendi",
            length = 5000
        },
        ["distanceControl"] = {
            msgType = "error",
            text = "Önce bilgisayariniza yaklasin ve bağlanti kurun",
            length = 5000
        },
        ["firstItemControl"] = {
            msgType = "error",
            text = "İlk eklenecek item bilgisayar olmalidir",
            length = 5000
        },
        ["alreadyPc"] = {
            msgType = "error",
            text = "Zaten 1 tane bilgisayar masaniz var",
            length = 5000
        }

    },

    MinerRackItem = { --Items give more coins according to their multiplier values, you can change the coin multipliers by increasing or decreasing these values
        [1] = {itemName = "ac_gpu_miner_1", itemImg = "gpu.png" , multiplier= 0.001 },
        [2] = {itemName = "ac_gpu_miner_2", itemImg = "gpu.png" , multiplier= 0.002 },
        [3] = {itemName = "ac_gpu_miner_3", itemImg = "gpu.png" , multiplier= 0.003 },
        [4] = {itemName = "ac_gpu_miner_4", itemImg = "gpu.png" , multiplier= 0.004 },
        [5] = {itemName = "ac_gpu_miner_5", itemImg = "gpu.png" , multiplier= 0.005 },
    },

    AppStore = {
        [1] = {
            appName = "Smoke Crack",
            appDesc = "Username,Crypto Address, and more",
            appImg = "../images/mask2.png",
            appCoin = 1,
            appType = "open"
        },
        [2] = {
            appName = "Notepad",
            appDesc = "Notepad for secure passwords, and more",
            appImg = "../images/notepad.png",
            appCoin = 0,
            appType = "open"
        },
        [3] = {
            appName = "Miner",
            appDesc = "Mines 1 crypto daily. Upgrade with GPU rack for faster mining",
            appImg = "../images/miner.png",
            appCoin = 0,
            appType = "open"
        },
        [4] = {
            appName = "Salty",
            appDesc = "Scan for accessible WI-FI Reveals MAC , fake IP , and security difficulty",
            appImg = "../images/scan.png",
            appCoin = 3,
            appType = "open"
        },
        [5] = {
            appName = "Wally",
            appDesc = "Username,Crypto Address, and more",
            appImg = "../images/wallet.png",
            appCoin = 0,
            appType = "open"
        },
        [6] = {
            appName = "Binunce",
            appDesc = "Public crypto transactions: users, MAC, addressess, amounts",
            appImg = "../images/binunce.png",
            appCoin = 0,
            appType = "open"
        },
        [7] = {
            appName = "Drone",
            appDesc = "???????????????????",
            appImg = "../images/drone.png",
            appCoin = 0,
            appType = "open"
        },
        [8] = {
            appName = "MinerEXT",
            appDesc = "???????????????????",
            appImg = "../images/minerext.png",
            appCoin = 0,
            appType = "open"
        },
        [9] = {
            appName = "HQ",
            appDesc = "Manage the HQ and unlock new features",
            appImg = "../images/hq3.png",
            appCoin = 0,
            appType = "notyet" --Do not change here. If you write notyet on an item, players will not be able to download it. It will be updated here when the Hq app is implemented. 
        },
       
    },
    
    WifiConnectionTime = {
        ["Hard Level"] = {
            time = 3 * 360 * 10000, -- 3 hour
        },
        ["Mid Level"] = {
            time = 2 * 360 * 10000, -- 2 hour
        },
        ["Easy Level"] = {
            time = 1 * 360 * 10000, -- 1 hour
        }
    },
    BluePrintNpcCoords = {
        [1] = {coords = vector4(482.8800, -75.2444, 77.563, 323.5)},
        [2] = {coords = vector4(-253.672, -696.945, 33.639, 311.7)},
        [3] = {coords = vector4(-1152.28, -1600.11, 4.3868, 61.46)},
        [4] = {coords = vector4(-1152.22, -1192.26, 2.9889, 167.0)},
        [5] = {coords = vector4(-1200.80, -836.337, 14.208, 241.3)},
        [6] = {coords = vector4(-1413.11, -464.673, 34.485, 112.6)},
        [7] = {coords = vector4(-872.516, -810.199, 19.284, 229.8)},
        [8] = {coords = vector4(-74.6445, -1458.97, 32.100, 165.9)},
        [9] = {coords = vector4(179.9033, -1330.23, 29.323, 222.4)},
        [10] = {coords = vector4(60.06127, -1057.03, 29.330, 226.1)},
    },
    BluePrintItem = {
        [1] = {butCoin = 2, itemType = "npc" ,  itemName =   "phone", itemLabel = "Blueprint - XTR 6060 GPU" , itemImg = "../images/print.png" },
        [2] = {butCoin = 3, itemType = "npc" ,  itemName =   "phone", itemLabel = "Blueprint - Mining Rack"  , itemImg = "../images/print.png" },
        [3] = {butCoin = 5, itemType = "npc" ,  itemName =   "phone", itemLabel = "Blueprint - XTR 6060 HDD" , itemImg = "../images/print.png" },
        [4] = {butCoin = 7, itemType = "npc" ,  itemName =   "phone", itemLabel = "Blueprint - XTR 6060 VPN" , itemImg = "../images/print.png" },
        [5] = {butCoin = 5, itemType = "drone" ,  itemName = "phone", itemLabel = "Grinder" , itemImg = "../images/grinder.png" },
        [6] = {butCoin = 6, itemType = "drone" ,  itemName = "phone", itemLabel = "Clipper Chimp Hero Prop" , itemImg = "../images/clipper.png" },
    },
    RandomCreatePed = {
        [1] = {hash = "s_m_y_dealer_01"},
        [2] = {hash = "ig_claypain"},
        [3] = {hash = "ig_hunter"},
        [4] = {hash = "ig_stretch"},
    },
    PropsAll = {
        [1] = {itemname = "ac_server1", label = "Server 1", hash = "1030147405" ,itemType="miner" ,  propname = "hei_prop_mini_sever_01"},
        [2] = {itemname = "ac_server2", label = "Server 2", hash = "1806543322" ,itemType="miner" ,  propname = "hei_prop_mini_sever_02"},
        [3] = {itemname = "ac_server3", label = "Server 3", hash = "412812214"  ,itemType="miner" ,  propname = "hei_prop_mini_sever_03"},
        [4] = {itemname = "ac_server4", label = "Server 4", hash = "1365277628" ,itemType="miner" ,  propname = "xm_base_cia_server_01"},
        [5] = {itemname = "ac_server5", label = "Server 5", hash = "3592488263" ,itemType="miner" ,  propname = "xm_base_cia_server_02"},
        [6] = {itemname = "ac_desk1", label = "Desk 1",     hash = "1845693979" ,itemType="desk"  ,  propname = "xm_prop_base_staff_desk_01"},
        [7] = {itemname = "ac_desk2", label = "Desk 2",     hash = "2084153992" ,itemType="desk"  ,  propname = "xm_prop_base_staff_desk_02"},
        [8] = {itemname = "ac_desk3", label = "Desk 3",     hash = "1230813074" ,itemType="desk"  ,  propname = "v_ind_dc_desk01"},
        [9] = {itemname = "ac_desk4", label = "Desk 4",     hash = "992647982"  ,itemType="desk"  ,  propname = "v_ind_dc_desk02"},
    },
    Props = {
        "hei_prop_mini_sever_01",
        "hei_prop_mini_sever_02",
        "hei_prop_mini_sever_03",
        "xm_base_cia_server_01",
        "xm_base_cia_server_02",
        "xm_prop_base_staff_desk_01",
        "xm_prop_base_staff_desk_02",
        "v_ind_dc_desk01",
        "v_ind_dc_desk02",
    },
    Ped = {
        ["peds"] = {
            [1] = {
                model = "cs_lestercrest",
                coords = vector4(1275.663, -1714.85, 53.871, 31.98),
                head = 211.58,
            }
    }
    }
}