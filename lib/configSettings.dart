const Map<String, dynamic> gameSettings = {
  "baseSearchForResidentCost": 0.20,
  "defaultRent": 600,
  "defaultMaxResidents": 10,
  "defaultHappiness": 50,
  "level2cost": 175000,
  "level3cost": 400000,
  "level4cost": 1000000,
  "level2maxResidents": 30,
  "level3maxResidents": 50,
  "level4maxResidents": 75,
  "propertyManagerHappinessImpact": 20,
  "taxRates": [
    0.185,
    0.25,
    0.325,
    0.45,
    0.55,
  ],
  "taxRateBreakpoints": [
    150000,
    400000,
    750000,
    1500000,
    3000000,
  ],
  "situationMinimumDays": 200,
  "situationChance": 150, // Out of X rolls, 1 will be a situation
};

const upgradeInfo = {
  "swimmingPool": {
    "name": "😊 Swimming pool",
    "desc": "This is a pool",
    "cost": 75000,
    "monthlyCostPerResident": 80,
    "instantHappiness": 30,
    "monthlyProfitPerResident": 0,
    "levelRequired": 2,
    "icon": "🩳",
  },
  "freeUitilities": {
    "name": "😊 Free Utilities",
    "desc": "Is it really free if the landlord pays for it?",
    "cost": 0,
    "monthlyCostPerResident": 100,
    "instantHappiness": 20,
    "monthlyProfitPerResident": 0,
    "levelRequired": 1,
    "icon": "💡",
  },
  "dogsAllowed": {
    "name": "😊 Dogs are allowed",
    "desc": "Puppers be free",
    "cost": 0,
    "monthlyCostPerResident": 0,
    "instantHappiness": 10,
    "monthlyProfitPerResident": 10,
    "levelRequired": 1,
    "icon": "🐶",
  },
  "catsAllowed": {
    "name": "😊 Cats are allowed",
    "desc": "Our properties are purrfect",
    "cost": 0,
    "monthlyCostPerResident": 0,
    "instantHappiness": 10,
    "monthlyProfitPerResident": 6,
    "levelRequired": 1,
    "icon": "🐱",
  },
  "easyTurnover": {
    "name": "💵 Easy turnover",
    "desc":
        "You no longer lose money when residents leave, but residents aren't happy with how gross the apartments end up becoming.",
    "cost": 0,
    "monthlyCostPerResident": 0,
    "instantHappiness": -20,
    "monthlyProfitPerResident": 0,
    "levelRequired": 1,
    "icon": "🧹",
  },
  "improvedSecurity": {
    "name": "😊 Improved security",
    "desc": "Keep your residents safe, and YOUR money safer",
    "cost": 15000,
    "monthlyCostPerResident": 40,
    "instantHappiness": 15,
    "monthlyProfitPerResident": 0,
    "levelRequired": 2,
    "icon": "🔒",
  },
  "gym": {
    "name": "😊 Onsite Gym",
    "desc": "Residents can get swole",
    "cost": 15000,
    "monthlyCostPerResident": 25,
    "instantHappiness": 15,
    "monthlyProfitPerResident": 0,
    "levelRequired": 2,
    "icon": "🏋️",
  },
  "playground": {
    "name": "😊 Outdoor Playground",
    "desc": "Kids can get swole",
    "cost": 15000,
    "monthlyCostPerResident": 0,
    "instantHappiness": 15,
    "monthlyProfitPerResident": 0,
    "levelRequired": 3,
    "icon": "🛝",
  },
  "basketball": {
    "name": "😊 Basketball Court",
    "desc": "Residents can play some b-ball. Cheap and encourages community",
    "cost": 10000,
    "monthlyCostPerResident": 0,
    "instantHappiness": 15,
    "monthlyProfitPerResident": 0,
    "levelRequired": 3,
    "icon": "🏀",
  },
};

const staffInfo = {
  "leasingAgent": {
    "name": "Leasing Agent",
    "desc":
        "Leasing Agents ensure that when residents leave, the vacancy is quickly filled without your intervention. They also reduce the cost to get new residents by half.",
    "cost": 0,
    "baseMonthlyCost": 5000,
    "monthlyCostPerProperty": 5000,
  },
  "propertyManager": {
    "name": "Property Mangaer",
    "desc":
        "Property Managers raise your properties' happiness and property value, by making sure that the properties are well maintained.",
    "cost": 0,
    "baseMonthlyCost": 3500,
    "monthlyCostPerProperty": 6000
  },
  "taxExpert": {
    "name": "Tax Expert",
    "desc":
        "Lower the amount you pay to the gov with a tax expert. May or may not be legal.",
    "cost": 0,
    "baseMonthlyCost": 0,
    "monthlyCostPerProperty": 0,
    "percentageOfAllProfit": 0.1
  },
  "advancedLeasingAgent": {
    "name": "Leasing Agent (advanced)",
    "desc": "This leasing agent is focused on finding new residents ",
    "cost": 0,
    "baseMonthlyCost": 0,
    "monthlyCostPerProperty": 0,
    "percentageOfAllProfit": 0.1
  },
};

const situationsList = [
  {
    "description": "One of your properties has burned down",
    "specialCase": null, // ignore this for now, leave null
    "req_propertyCount": 3, // number of properties required
    "req_money": 0, // amount of money required for this to trigger
    "options": [], // no options means the only option is 'ok'
    "optionsActions": [], // no options means the only option is 'ok'
    "impactOnGlobalHappiness": -20, // between -50 and 50
    "impactOnMoney": 0, // usually negative to indicate a loss, -150 = $150 loss
    "impactOnEconomy": 0, // between -150 and 150, usually -50 to 50
    "impactOnPlotCount":
        -1, // -1 means a building disappears, 1 means a building appears
  },
  {
    "description":
        "A recent spike in local crime rate has decreased the value of your properties.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -10,
    "impactOnMoney": -15000,
    "impactOnEconomy": -30,
    "impactOnPlotCount": 0
  },
  {
    "description": "A natural disaster has damaged some of your properties.",
    "specialCase": null,
    "req_propertyCount": 3,
    "req_money": 100000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -25,
    "impactOnMoney": -40000,
    "impactOnEconomy": -50,
    "impactOnPlotCount": -1
  },
  {
    "description": "An error in your tax return has resulted in a hefty fine.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": -20000,
    "impactOnEconomy": 0,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Your tenant claims to have found Jimmy Hoffa's secret stash in the basement. Treasure hunters have caused damages.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 20000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -2,
    "impactOnMoney": -10000,
    "impactOnEconomy": -10,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Your properties have been chosen as filming locations for a big Hollywood movie. You receive a generous location fee.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 30000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 10,
    "impactOnMoney": 70000,
    "impactOnEconomy": 20,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "You've accidentally built a property on an ancient burial ground. Exorcism expenses ensue.",
    "specialCase": null,
    "req_propertyCount": 3,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -20,
    "impactOnMoney": -15000,
    "impactOnEconomy": -20,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Aliens have abducted one of your properties. On the bright side, they've left behind a crop circle tourist attraction.",
    "specialCase": null,
    "req_propertyCount": 4,
    "req_money": 60000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 20000,
    "impactOnEconomy": 10,
    "impactOnPlotCount": -1
  },
  {
    "description":
        "You find a rare coin collection in a newly acquired property. It's worth quite a few pennies!",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 40000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 80000,
    "impactOnEconomy": 10,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your properties turned out to be a superhero's secret hideout. Repairs from frequent battles are costly.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 70000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": -30000,
    "impactOnEconomy": -20,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "An eccentric billionaire wants to pay you double the price for a 'haunted' property you own.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 100000,
    "impactOnEconomy": 15,
    "impactOnPlotCount": -1
  },
  {
    "description":
        "Your property has been overrun by a herd of unusually aggressive squirrels.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 30000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -10,
    "impactOnMoney": -3500,
    "impactOnEconomy": -10,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "You've discovered a forgotten Picasso in the attic of one of your properties. It sells for a hefty price at an auction.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 40000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 200000,
    "impactOnEconomy": 10,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A groundhog with a fondness for chewing utility lines has caused a power outage in one of your properties. Repair costs are substantial.",
    "specialCase": null,
    "req_propertyCount": 3,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -15,
    "impactOnMoney": -20000,
    "impactOnEconomy": -20,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "An unexpected oil strike on one of your properties makes you an overnight millionaire.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 30000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 25,
    "impactOnMoney": 1000000,
    "impactOnEconomy": 70,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Your property was mistakenly included in a treasure hunt map. You're left with a massive repair bill after a treasure hunting frenzy.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 60000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -25000,
    "impactOnEconomy": -20,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "You find a stash of vintage wines in one of your properties. They sell for a small fortune.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 40000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 120000,
    "impactOnEconomy": 40,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your properties has been mistakenly listed as the new HQ of a major tech company. Investors swarm and offer a massive buyout.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 50000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 30,
    "impactOnMoney": 300000,
    "impactOnEconomy": 50,
    "impactOnPlotCount": -1
  },
  {
    "description":
        "Your property is destroyed by a rampaging T-Rex from a malfunctioning local Jurassic Park replica. Insurance doesn't cover 'dinosaur damage'.",
    "specialCase": null,
    "req_propertyCount": 4,
    "req_money": 300000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -25,
    "impactOnMoney": -50000,
    "impactOnEconomy": -30,
    "impactOnPlotCount": -1
  },
  {
    "description":
        "A local artist painted a mural on your property. It looks nice, but the cost to keep it protected is an unexpected expense.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 10000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -1000,
    "impactOnEconomy": -5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your tenants won a small local lottery and decided to pay a year's rent upfront.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 20000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 10,
    "impactOnMoney": 5000,
    "impactOnEconomy": 5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "You've received a fine for not trimming the tree in front of one of your properties.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 15000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -500,
    "impactOnEconomy": -2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your properties needs new carpet. It's a necessary expense, but it does cut into your profits.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 25000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -10,
    "impactOnMoney": -3000,
    "impactOnEconomy": -5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A small local coffee shop opened nearby one of your properties, slightly increasing its value.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 20000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 1000,
    "impactOnEconomy": 5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A tenant organized a community garden in one of your properties. It increases overall happiness but requires maintenance.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 15000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 10,
    "impactOnMoney": -500,
    "impactOnEconomy": 5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Your property's rooftop has been rented for a yoga class. It's not much, but it's extra income.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 10000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 1000,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your properties was voted 'Ugliest Building of the Year'. It's a bit embarrassing, but it doesn't affect your finances.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 30000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": 0,
    "impactOnEconomy": -2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A local bakery has agreed to supply pastries to your tenants every morning. It's a small expense, but it greatly increases happiness.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 25000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 10,
    "impactOnMoney": -500,
    "impactOnEconomy": 5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "The city has increased garbage collection fees. It's a necessary service, but it eats into your income.",
    "specialCase": null,
    "req_propertyCount": 3,
    "req_money": 40000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -1000,
    "impactOnEconomy": -5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "The mailman delivers a check by mistake. It's not yours, but you fantasize about what you'd do with that amount of money.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 20000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 0,
    "impactOnEconomy": 0,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "The city has implemented new energy regulations. You need to invest a small amount into making your properties compliant.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 25000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -2000,
    "impactOnEconomy": -5,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A tenant's pet has won a local dog show, bringing positive attention to your property.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 15000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 500,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "The local high school has asked to film a scene for their annual play at your property. It's not for profit, but it does bring some goodwill.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 10000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 0,
    "impactOnEconomy": 1,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A local news station has decided to do a feature on one of your properties. It doesn't impact your finances but does give you some pride.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 30000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 0,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "Your properties have been rated as having the best landscaping in the city. It's a small boost to happiness but costs a bit to maintain.",
    "specialCase": null,
    "req_propertyCount": 3,
    "req_money": 35000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 10,
    "impactOnMoney": -1000,
    "impactOnEconomy": 3,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "One of your properties' old plumbing needs updating. It's not a major repair, but it's an unexpected expense.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 20000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": -5,
    "impactOnMoney": -1500,
    "impactOnEconomy": -4,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A local ice cream shop wants to use your parking lot for their food truck. You won't make much money, but it does increase local happiness.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 10000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 7,
    "impactOnMoney": 500,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A small film festival is happening nearby one of your properties. It doesn't change your income, but it does increase the overall happiness of your tenants.",
    "specialCase": null,
    "req_propertyCount": 1,
    "req_money": 15000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 5,
    "impactOnMoney": 0,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  },
  {
    "description":
        "A tenant offers to paint one of your properties at a discount. It's an opportunity to update the property at a lower cost.",
    "specialCase": null,
    "req_propertyCount": 2,
    "req_money": 25000,
    "options": [],
    "optionsActions": [],
    "impactOnGlobalHappiness": 0,
    "impactOnMoney": 1000,
    "impactOnEconomy": 2,
    "impactOnPlotCount": 0
  }
];
