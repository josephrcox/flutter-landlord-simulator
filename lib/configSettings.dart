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
    "monthlyCostPerProperty": 5000
  },
};

const situationsList = [
  {
    "name": "One of your properties has burned down",
    "req_propertyCount": 3,
    "req_propertyManagerHired": false,
    "req_money": 0,
    "options": [],
    "optionsActions": [],
    "globalHappinessImpact": -20,
  },
];
