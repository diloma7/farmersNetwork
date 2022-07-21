import 'dart:convert';

import 'package:printing/printing.dart';

class CashFlowViewModel {
  List actualIncome = [];
  List actualExpenditure = [];
  List budgetIncome = [];
  List budgetExpenditure = [];

  List<dynamic> CashFlow = [
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "6ead4144-db5d-4ba8-b087-7d3190e05503",
      "cashFlowSign": "-",
      "cashFlowId": "01e143ec-9fd1-4dad-b6f3-82c558442aad",
      "cashFlowName": "Harvest/Package/Storage",
      "amount": 250
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "5fe2ada0-f405-4a13-8ae3-125e9c237424",
      "cashFlowSign": "+",
      "cashFlowId": "02f5942d-c147-45e9-9ac4-3f3f28fb886e",
      "cashFlowName": "Sales",
      "amount": 1000
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "be46dd4d-585b-4398-8f60-c4c90f8cafb3",
      "cashFlowSign": "-",
      "cashFlowId": "07754ddd-794c-4109-8350-9fbe2ce1b8b7",
      "cashFlowName": "Transport",
      "amount": 1000
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "9cfa6ca5-0962-4704-a253-fa1b5d491455",
      "cashFlowSign": "-",
      "cashFlowId": "10d0df17-4397-42c4-84ef-4fa40c7d7e1e",
      "cashFlowName": "Harvest/Package/Storage",
      "amount": 1000
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "b915c837-ca41-4593-a796-74457f53a317",
      "cashFlowSign": "+",
      "cashFlowId": "280cbf50-2ded-4af8-a65e-37dedb7853ad",
      "cashFlowName": "Bonus",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "6e3a68fd-a575-437f-ac73-3466467c7c76",
      "cashFlowSign": "-",
      "cashFlowId": "2c35d4cd-1714-4538-aff2-b91dbd43fa71",
      "cashFlowName": "Crop/Animal Nutrition",
      "amount": 100
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "ef03a327-0693-4c30-8483-c23990549498",
      "cashFlowSign": "+",
      "cashFlowId": "2c8692ec-e951-4303-8974-50ab14f48f11",
      "cashFlowName": "Other",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "aefd4157-c21b-443a-8b64-287a0241fe3d",
      "cashFlowSign": "-",
      "cashFlowId": "354ce14a-2f61-48ae-b360-fd863d0fe27c",
      "cashFlowName": "Seeds",
      "amount": 10
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "3d2ee4c1-1225-4368-99b3-9914c7f1bca6",
      "cashFlowSign": "+",
      "cashFlowId": "3df35a4e-8c7c-44bb-bd2f-c761eb3c3616",
      "cashFlowName": "Sponsorship",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "866e1e4b-b774-4fcc-a79d-c55b90aa6c05",
      "cashFlowSign": "-",
      "cashFlowId": "467a6647-7a84-4c1e-bdce-63c4671631c8",
      "cashFlowName": "Credit Cost",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "7c44117e-bdd8-40c0-b026-25fb7f4af062",
      "cashFlowSign": "+",
      "cashFlowId": "47f68a66-de92-4247-b7fb-5dff581a1b48",
      "cashFlowName": "Bonus",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "1e6a081c-9947-4f31-b91c-e5dcc52a6436",
      "cashFlowSign": "+",
      "cashFlowId": "4da2f287-b71a-4ad2-b7ce-266d94a99625",
      "cashFlowName": "Sales",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "4589e70b-d3a3-477e-936a-d023974f149e",
      "cashFlowSign": "+",
      "cashFlowId": "5f3b831c-b4a5-4faf-91f4-e04642684065",
      "cashFlowName": "Sponsorship",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "3f7c6765-d2c6-44b3-bf5a-b6e40c882bae",
      "cashFlowSign": "-",
      "cashFlowId": "5fc97370-d4ec-41b2-9fe5-fb0d5b50b358",
      "cashFlowName": "Seeds",
      "amount": 5
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "e59e0467-8c6a-4b5a-b061-dddb5aaad680",
      "cashFlowSign": "+",
      "cashFlowId": "6330b869-fb16-4853-b487-423d947dc2db",
      "cashFlowName": "Loyalties",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "00a1b81e-5bad-4ddf-b0c5-71cc16858883",
      "cashFlowSign": "-",
      "cashFlowId": "6450c318-814b-4dbc-b6f9-cc3d8c34298b",
      "cashFlowName": "Crop/Animal protection",
      "amount": 200
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "3d1d5930-93a5-4ff3-96a4-588c4916c625",
      "cashFlowSign": "-",
      "cashFlowId": "7499256d-c99f-490b-a1de-a77411af135f",
      "cashFlowName": "Land Preperation",
      "amount": 7
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "9f0ab182-608f-4116-a8a0-08055f10d361",
      "cashFlowSign": "-",
      "cashFlowId": "8014dd22-d803-4dca-83c2-fa440ecb0496",
      "cashFlowName": "Labour",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "0f7e3617-5849-4451-84ec-5dd2d6ed10e1",
      "cashFlowSign": "-",
      "cashFlowId": "80c29925-be55-4e2b-9b0e-899c5d441a1c",
      "cashFlowName": "Land Preperation",
      "amount": 10
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "2bd6f8df-c701-4cb2-bbba-fac63fa9305a",
      "cashFlowSign": "+",
      "cashFlowId": "815dcc9d-03ba-4bf7-95e5-559b1168e926",
      "cashFlowName": "Interest",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "0edb4c98-75c1-47e0-b1bd-e81f33801a2f",
      "cashFlowSign": "+",
      "cashFlowId": "9fe076b5-afd9-46a7-8e92-5089ae09e58b",
      "cashFlowName": "Commissions",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "37c29e1d-01b0-4492-a5e3-e20dc0c7c564",
      "cashFlowSign": "+",
      "cashFlowId": "adabfc1e-b596-4e74-be9b-fd1e0828ce33",
      "cashFlowName": "Loyalties",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "19145c55-3e7c-4c83-ab8b-a27165a87a07",
      "cashFlowSign": "-",
      "cashFlowId": "b1fd506a-a69d-4794-812c-6fed00f6ce56",
      "cashFlowName": "Other",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "90fd63f5-22d3-47e5-9339-2f73c159fe8b",
      "cashFlowSign": "-",
      "cashFlowId": "cd121d55-7924-4926-9dce-26b8a4cd1a62",
      "cashFlowName": "Credit Cost",
      "amount": 50
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "ecd8febb-9705-40c6-9e7e-2c990ba07719",
      "cashFlowSign": "-",
      "cashFlowId": "d033300e-163b-41c9-84b4-94881a879b81",
      "cashFlowName": "Crop/Animal Nutrition",
      "amount": 200
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "3c3e3b3a-5a20-41aa-b68c-85151faade0d",
      "cashFlowSign": "+",
      "cashFlowId": "e12348c0-755f-44ce-ab0d-74b814eb4c8c",
      "cashFlowName": "Other",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "8aa0bc1e-1ebe-46af-a06a-b8d13cfffea7",
      "cashFlowSign": "-",
      "cashFlowId": "e375221b-c0c7-4f61-9573-f2af059bfd56",
      "cashFlowName": "Other",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "7e583123-6d76-4af7-8600-e53dcbbe2515",
      "cashFlowSign": "-",
      "cashFlowId": "e54216b1-e76f-49a4-a5c0-1f3999835fa3",
      "cashFlowName": "Labour",
      "amount": 0
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Income",
      "financeItemId": "e9077233-3e20-40de-8b44-2b4f8153cd49",
      "cashFlowSign": "+",
      "cashFlowId": "edcb1194-84ba-4d05-90e2-6de46dab5cbf",
      "cashFlowName": "Interest",
      "amount": 0
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Expenditure",
      "financeItemId": "cc43dc17-afd6-4c4f-8beb-42025b624f85",
      "cashFlowSign": "-",
      "cashFlowId": "efeac683-0a2f-48d2-8bb0-e09707fd5958",
      "cashFlowName": "Transport",
      "amount": 400
    },
    {
      "financeName": "BUDGET",
      "financeDetailsName": "Expences",
      "financeItemId": "a75abab8-7820-4796-8dd3-3b5aeba38e75",
      "cashFlowSign": "-",
      "cashFlowId": "f2febc6c-dd55-4a06-a38f-d4e64e7956cb",
      "cashFlowName": "Crop/Animal protection",
      "amount": 600
    },
    {
      "financeName": "Actual",
      "financeDetailsName": "Revenue",
      "financeItemId": "ee5f7b02-890d-41aa-92a6-1998421f8d84",
      "cashFlowSign": "+",
      "cashFlowId": "fe262519-2b3a-46ca-aad5-c8e587099af8",
      "cashFlowName": "Commissions",
      "amount": 0
    }
  ];
  // need to pass to variable budget && income or else
  double sumCashflow = 0.0;

  differenceWork(String filterData) {
    List dataResults = [];
    Map dataPopulate = {};

    for (var i = 0; i < CashFlow.length; i++) {
      if (CashFlow[i]['financeDetailsName'] == 'Expences') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
        dataPopulate['financeItemId'] = CashFlow[i]['financeItemId'];
        dataPopulate['cashFlowId'] = CashFlow[i]['cashFlowId'];
        print(dataPopulate);
      } else if (CashFlow[i]['financeName'] == 'Actual' &&
          filterData == 'ExpenditureActual' &&
          CashFlow[i]['financeDetailsName'] == 'Expenditure') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      } else if (CashFlow[i]['financeName'] == 'BUDGET' &&
          filterData == 'BudgetIncome' &&
          CashFlow[i]['financeDetailsName'] == 'Income') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      } else if (CashFlow[i]['financeName'] == 'BUDGET' &&
          filterData == 'BudgetIncome' &&
          CashFlow[i]['financeDetailsName'] == 'Income') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      }
    }
    //print(dataResults);
    //print("sumCashflow: " + sumCashflow.toString());

    return dataResults;
  }

  populateData(String filterData) {
    List dataResults = [];

    //print(CashFlow.length);
    for (var i = 0; i < CashFlow.length; i++) {
      if (CashFlow[i]['financeName'] == 'BUDGET' &&
          filterData == 'BudgetExpenditure' &&
          CashFlow[i]['financeDetailsName'] == 'Expences') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
        budgetExpenditure = dataResults;
      } else if (CashFlow[i]['financeName'] == 'Actual' &&
          filterData == 'ExpenditureActual' &&
          CashFlow[i]['financeDetailsName'] == 'Expenditure') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      } else if (CashFlow[i]['financeName'] == 'BUDGET' &&
          filterData == 'BudgetIncome' &&
          CashFlow[i]['financeDetailsName'] == 'Income') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      } else if (CashFlow[i]['financeName'] == 'BUDGET' &&
          filterData == 'BudgetIncome' &&
          CashFlow[i]['financeDetailsName'] == 'Income') {
        sumCashflow = sumCashflow + CashFlow[i]['amount'];
        dataResults.add({
          CashFlow[i]['cashFlowName'],
          CashFlow[i]['financeItemId'],
          CashFlow[i]['cashFlowId'],
          CashFlow[i]['amount'],
        });
      }
    }
    print("-------------------------------------------------------");
    print(budgetExpenditure);
    //print("sumCashflow: " + sumCashflow.toString());
    print("-------------------------------------------------------");
    return dataResults;
  }
}
