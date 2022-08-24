
<h1>Usage</h1>
Add following command in your server.cfg File

```ensure zykem-drugdealers```

<h1>Config</h1>
```cfg = {}

cfg.commandName = "dealermenu"
cfg.notEnough = "Nie sprzedałeś wystarczająco Narkotyków aby przejśc na następny Poziom!"
cfg.LevelUp = "Pomyślnie przeszedłeś na następny Poziom!"

-- LevelUp Shake Effect
cfg.ShakeMultiplier = 0.1


-- ESX Initialization Event
cfg.esxObject = "exilerp:getSharedObject"
-- ESX Player loaded Event
cfg.pLoaded = "esx:playerLoaded"
-- ESX JobUpdate
cfg.pJobUpdate = "esx:setJob"

-- Ilosc narkotyku ile musisz sprzedac aby przejsc na dany Level
cfg.weedLvl1 = 25
cfg.weedLvl2 = 50
cfg.weedLvl3 = 100
cfg.weedLvl4 = 300
cfg.weedLvl5 = 500

cfg.cokeLvl1 = 50
cfg.cokeLvl2 = 100
cfg.cokeLvl3 = 300
cfg.cokeLvl4 = 500
cfg.cokeLvl5 = 1000

cfg.methLvl1 = 50
cfg.methLvl2 = 100
cfg.methLvl3 = 250
cfg.methLvl4 = 500
cfg.methLvl5 = 1000```

<h1>Preview</h1>
<img src="https://cdn.discordapp.com/attachments/931320917420826705/1012129555043074138/unknown.png">

<h1>Features</h1>
<ul>
    <li>Main Panel with Statistics and LevelUP Button</b></li>
    <li>By selling more drugs, you can level up.</b></li>
    <li>Highly Configurable</li>

</ul>
<h1>Showcase</h1>
<ul>
  <li>https://youtu.be/o53_gvbetqE</li>
</ul>

<h1>Todo</h1>
<ul>
    <li>Making it more universal (only works for custom drugselling scripts)</li>
    <li>Finishing it completely (adding another panel for buying custom things like Drug sell Price boost, etc.</li>
</ul>
