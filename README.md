<div align="center">
    <img width="400px" src="https://github.com/UniqueNetwork/unique-sdk/blob/master/doc/logo-white.svg" alt="Unique Network">
</div>

# UniqueSDK

UniqueSDK allows you to build NFT applications from scratch or to connect your existing apps that work on other blockchains to the Unique Network. This means that you can take advantage of the unique features of the Unique Network and offer your users a one-of-a-kind experience.

## Installation

Setup instructions:

### CocoaPod

Put this in your `Podfile`:

```Ruby
pod 'UniqueSDK'
```

### Swift Package Manager

To install UniqueSDK package into your packages, add a reference to UniqueSDK and a targeting release version in the dependencies section in `Package.swift` file:

```Swift
.package(url: "https://github.com/UniqueNetwork/unique-sdk-swift.git", from: "0.0.5")
```

To install UniqueSDK package via Xcode

 * Go to Project -> Package Dependencys -> Hit Plus Button...
 * Then search for https://github.com/UniqueNetwork/unique-sdk-swift.git
 * And choose the version you want

## Usage Examples

Following are some examples to demonstrate usage of the library.

#### First of all - set chain configuration that you preffer and save user passcode for submiting transactions

```Swift
Unique.setConfiguration(.opal)
Unique.savePasscode("1234")
```

#### Create user account

```Swift
let account = UNQAccount(name: "AccountName", address: "AccountAddress", mnemonic: "AccountMnemoic")
Unique.Account.addAccount(account)
```

#### Create simple collection
```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let body = UNQCreateColletionBody(mode: .nft,
                                  name: "Name",
                                  description: "Description",
                                  tokenPrefix: "TokenPrefix",
                                  sponsorship: nil,
                                  limits: nil,
                                  metaUpdatePermission: nil,
                                  permissions: nil,
                                  readOnly: false,
                                  address: "Address",
                                  schema: nil,
                                  properties: nil,
                                  tokenPropertyPermissions: nil)
Task {
    do {
        let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters,
                                                                      body: body,
                                                                      account: account,
                                                                      userAuthenticationType: .biometric)
    } catch (let error) {
        print(error)
    }
}    
```

#### Create simple token
```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let body = UNQCreateTokenBody(owner: "OwnerAddress", data: nil, properties: nil, address: "Address", collectionId: 0)
Task {
    do {
        let result = try await Unique.Token.create.submitWatch(parameters: buildParameters,
                                                               body: body,
                                                               account: account,
                                                               userAuthenticationType: .biometric)        
    } catch (let error) {
        print(error)
    }
}
```

#### Create collection with attributes

```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let jsonAny1 = JSONAny(value: ["_": "Male"])
let jsonAny2 = JSONAny(value: ["_": "Female"])
let enumValues: [String: JSONAny] = [
    "0": jsonAny1,
    "1": jsonAny2
]
let atr = UNQAttributeSchema(name: ["_": "gender"],
                             optional: nil,
                             type: "string",
                             enumValues: enumValues,
                             isArray: nil)
let attributesSchema: [String: UNQAttributeSchema] = ["0": atr]
let schema = UNQCollectionSchemaToCreate(
    attributesSchema: attributesSchema,
    attributesSchemaVersion: "1",
    coverPicture: UNQCoverPicture(urlInfix: "", url: nil, ipfcCid: nil, hash: ""),
    image: UNQCollectionSchemaImage(urlTemplate: "https://ipfs.unique.network/ipfs/{infix}.ext"),
    schemaName: UNQSchemaName.unique,
    schemaVersion: "1.0.0",
    coverPicturePreview: nil,
    imagePreview: nil,
    audio: nil,
    spatialObject: nil,
    video: nil
)
let body = UNQCreateColletionBody(mode: .nft,
                                  name: "Name",
                                  description: "Description",
                                  tokenPrefix: "TokenPrefix",
                                  sponsorship: nil,
                                  limits: nil,
                                  metaUpdatePermission: nil,
                                  permissions: nil,
                                  readOnly: false,
                                  address: "Address",
                                  schema: schema,
                                  properties: nil,
                                  tokenPropertyPermissions: nil)
Task {
    do {
        let result = try await Unique.Collection.creation.submitWatch(parameters: buildParameters,
                                                                      body: body,
                                                                      account: account,
                                                                      userAuthenticationType: .biometric)
    } catch (let error) {
        print(error)
    }
}
```

#### Create token with attributes
```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let image = UNQEncodedInfixOrUrlOrCidAndHash(urlInfix: "string", url: nil, ipfsCid: nil, hash: "string")
let encodedAttribute: [String: JSONAny] = [
    "0": JSONAny(value: 0)
]
let data = UNQTokenToCreateDto(image: image,
                               attributes: nil,
                               encodedAttributes: encodedAttribute,
                               name: nil,
                               audio: nil,
                               description: nil,
                               imagePreview: nil,
                               spatialObject: nil,
                               video: nil)
let body = UNQCreateTokenBody(owner: "OwnerAddress", data: data, properties: nil, address: "Address", collectionId: 0)
Task {
    do {
        let result = try await Unique.Token.create.submitWatch(parameters: buildParameters,
                                                               body: body,
                                                               account: account,
                                                               userAuthenticationType: .biometric)
        print(result)
        
    } catch (let error) {
        print(error)
    }
}
```

#### Transfer token

```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let body = UNQTransferTokenBody(collectionId: 0,
                                tokenId: 1,
                                address: "Address",
                                from: "FromAddress",
                                to: "ToAddress",
                                value: nil)
Task {
    do {
        let result = try await Unique.Token.transfer.submitWatch(parameters: buildParameters,
                                                                 body: body,
                                                                 account: account,
                                                                 userAuthenticationType: .biometric)
        print(result)
        
    } catch (let error) {
        print(error)
    }
}
```

#### Transfer balance

```Swift
guard let account = Unique.Account.loadAccounts().first else { return }
let buildParameters = UNQRequestParameters(withFee: nil, verify: nil, callbackUrl: nil, nonce: nil)
let body = UNQBalanceTransferBody(address: "Address", destination: "DestinationAddrress", amount: 100)
Task {
    do {
        let result = try await Unique.Balance.transfer.submitWatch(parameters: buildParameters,
                                                                   body: body, 
                                                                   account: account,
                                                                   userAuthenticationType: .biometric)
        print(result)
    } catch (let error) {
        print(error)
    }
}
```

## License

Distributed under the MIT License.
