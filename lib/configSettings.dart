const Map<String, dynamic> gameSettings = {
  "baseSearchForResidentCost": 0.20,
  "defaultRent": 600,
  "defaultMaxResidents": 10,
  "defaultHappiness": 50,
};

const upgradeInfo = {
  "swimmingPool": {
    "name": "Swimming pool",
    "desc": "This is a pool",
    "cost": 15000,
    "monthlyCostPerResident": 80,
    "instantHappiness": 18,
    "monthlyProfitPerResident": 0,
    "levelRequired": 2,
    "icon": "🩳",
  },
  "freeUitilities": {
    "name": "Free Utilities",
    "desc": "Is it really free if the landlord pays for it?",
    "cost": 0,
    "monthlyCostPerResident": 100,
    "instantHappiness": 20,
    "monthlyProfitPerResident": 0,
    "levelRequired": 1,
    "icon": "💡",
  },
  "dogsAllowed": {
    "name": "Dogs are allowed",
    "desc": "Puppers be free",
    "cost": 0,
    "monthlyCostPerResident": 0,
    "instantHappiness": 10,
    "monthlyProfitPerResident": 10,
    "levelRequired": 1,
    "icon": "🐶",
  },
  "catsAllowed": {
    "name": "Cats are allowed",
    "desc": "Our properties are purrfect",
    "cost": 0,
    "monthlyCostPerResident": 0,
    "instantHappiness": 10,
    "monthlyProfitPerResident": 6,
    "levelRequired": 1,
    "icon": "🐱",
  },
  "easyTurnover": {
    "name": "Easy turnover",
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
    "name": "Improved security",
    "desc": "Keep your residents safe, and YOUR money safer",
    "cost": 15000,
    "monthlyCostPerResident": 40,
    "instantHappiness": 15,
    "monthlyProfitPerResident": 0,
    "levelRequired": 2,
    "icon": "🔒",
  },
};

const staffInfo = {
  "manager": {
    "name": "Property Manager",
    "desc":
        "Property Managers ensure that when residents leave, the vacancy is quickly filled without your intervention. The manager also reduces the cost to get new residents by half.",
    "cost": 0,
    "baseMonthlyCost": 5000,
    "monthlyCostPerProperty": 5000
  },
};

const situationsList = [
  {
    "name": "One of your properties burned down",
    "req_propertyCount": 1,
    "req_propertyManagerHired": false,
    "req_money": 0,
    "options": [],
    "optionsActions": [],
    "globalHappinessImpact": -25,
  },
];
