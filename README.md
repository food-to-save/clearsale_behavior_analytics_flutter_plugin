
# Clearsale Behavior Analytics SDK

  

Plugin Flutter do SDK Behavior Analytics da Clearsale

  ## Dependências
Inserir no pubspec.yaml a dependência a seguir:
```sh
dependencies:
	behavior_analytics_flutter_sdk:
		git:
			url: https://PublicPackagesCS@dev.azure.com/PublicPackagesCS/Behavior/_git/BehaviorAnalytics.SDK.Flutter
			ref: main
			version: 0.3.6
```

  
  

## Proguard
 

Configurações que precisam ser adicionadas ao arquivo de configuração do Proguard.
  
Obrigatário
```sh

-keep class sale.clear.behavior.android.** { *; }

-keep interface com.google.gson.annotations.Expose

-keep interface com.google.gson.annotations.SerializedName

```
Recomendado
```sh
-keepattributes Exceptions

```

  
  

## Configuração de release recomendada

Essa é uma recomendação de configuração base para a release.  

```sh

buildTypes {

release {

shrinkResources true

minifyEnabled true

proguardFiles getDefaultProguardFile('proguard-android.txt'),
	'proguard-rules.pro'
	signingConfig signingConfigs.debug 
	}
}
```

## Dados e descrição
| Dado | Descrição |
|--|--|
| SessionID | ID de sessão da coleta de device, deve ser enviado para a Clearsale tambem junto ao pedido |
| AppKey | Valor fornecido pela Clearsale, que serve para identificar a origem da coleta de device.
|||

## Implementação

#### Inicialização do SDK
```sh
import  'package:behavior_analytics_flutter_sdk/behavior_analytics_flutter_sdk.dart';

class  MyApp  extends  StatefulWidget {
@override
	_MyAppState  createState() => _MyAppState();
}

class  _MyAppState  extends  State<MyApp> {
@override
void  initState() {
	super.initState();
	BehaviorAnalyticsFlutterSdk.start("appkey_fornecido_pela_clearsale");
}

```
#### Coleta de device
Exemplo de coleta
```sh

void _handleButtonPress() {
    BehaviorAnalyticsFlutterSdk.generateSessionID().then((sessionID) {
        BehaviorAnalyticsFlutterSdk.collectDeviceInformation(sessionID);

        print(sessionID);

        setState(() {
          _sessionID = sessionID;
        });
    });
}

@override
Widget build(BuildContext context) {
	print('build');
	return MaterialApp(
		home: Scaffold(
		appBar: AppBar(
			title: const Text('BehaviorAnalytics Plugin Example'),
		),
		body: Center(
			child: Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: [
				Text('SessionID: $_sessionID\n'),
				ElevatedButton(
				onPressed: _handleButtonPress,
				child: Text('Coletar'),
				),
			],
			),
		),
		),
	);
}

```