import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../constant/Constant.dart';

// http.Client httpClient;
Web3Client ethClient;
// final contractAddress = contractAdress1;
// final privateKey = infuraAllergyCom_privateKey;

// void initialSetup() {
//   httpClient = http.Client();
//   String infura =
//       "https://sepolia.infura.io/v3/" + dotenv.env['INFURA_PROJECT_ID'];
//   ethClient = Web3Client(infura, httpClient);
// }
Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contractAdress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'OnlineCommunity'),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}
// Future<DeployedContract> getDeployedContract() async {
//   String abi = await rootBundle.loadString("assets/abi.json");
//   final contract = DeployedContract(ContractAbi.fromJson(abi, "FirstCoin"),
//       EthereumAddress.fromHex(contractAddress));
//   return contract;
// }

//
// Future<DeployedContract> loadContract() async {
//   String abi = await rootBundle.loadString('assets/abi.json');
//   String contractAddress = contractAdress1;
//   final contract = DeployedContract(ContractAbi.fromJson(abi, 'FirstCoin'),
//       EthereumAddress.fromHex(contractAddress));
//   return contract;
// }

Future<String> callFunction(
    String funcname,
    List<dynamic> args,
    Web3Client ethClient,
    String privateKey
    ) async {
  if (ethClient == null) {
    throw Exception('ethClient is null. Please initialize it before calling callFunction.');
  }
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: ethFunction,
      parameters: args,
    ),
    chainId: null,
    fetchChainIdFromNetworkId: true,
  );
  return result;
}

Future<String> addPost(
    String title,
    String description,
    Web3Client ethClient
    ) async {
  var response = await callFunction(
    'createContentmult',
    [title, description],
    ethClient,
    infuraAllergyCom_privateKey,
  );
  print('post added successfully');
  return response;
}

//
Future<List<dynamic>> getBalance(Web3Client ethClient) async {
  // var cid = BigInt.from(1);
  List result = await ask("getAllContents", [],ethClient);
  var data = result;
  return data[0];
}

// Future<List<dynamic>> voteContent(int contentId, bool vote, Web3Client ethClient) async {
//   var response = await ask(
//     'voteContent',
//     [BigInt.from(contentId)],
//     ethClient,
//   );
//   print('Content $contentId vote $vote added successfully');
//   return response;
// }

Future<String> voteContent(int contentId, bool vote, Web3Client ethClient) async {
  var response = await callFunction(
    'voteContent',
    [BigInt.from(contentId)],
    ethClient,
    infuraAllergyCom_privateKey,
  );
  print('Content $contentId vote $vote added successfully');
  return response;
}
Future<String> downvoteContent(int contentId, bool vote, Web3Client ethClient) async {
  var response = await callFunction(
    'downvoteContent',
    [BigInt.from(contentId)],
    ethClient,
    infuraAllergyCom_privateKey,
  );
  print('Content $contentId vote $vote added successfully');
  return response;
}
// Future<List<dynamic>> registerUser(String username,String password, Web3Client ethClient) async {

//   var response = await ask(
//     'registerUser',
//     [username, password],
//     ethClient,
//   );
//   if (response.length > 0) {
//     return response;
//   } else {
//     throw Exception('registerUser failed');
//   }
// }
Future<String> registerUser(
    String username,
    String password,
    Web3Client ethClient
    ) async {
  var response = await callFunction(
    'registerUser',
    [username, password],
    ethClient,
    infuraAllergyCom_privateKey,
  );
  print('User registered successfully');
  return response;
}



Future<List> getContentLength(Web3Client ethClient) async {
  List<dynamic> result = await ask('getContentLength', [], ethClient);
  return result;
}

Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
  final contract = await loadContract();
  final ethFunction = contract.function(functionName);
  final result = await ethClient?.call(
      contract: contract, function: ethFunction, params: args);
  return result;
}
Future<List<dynamic>> ask(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethFunction = contract.function(funcName);
  final result =
  ethClient.call(contract: contract, function: ethFunction, params: args);
  return result;
}