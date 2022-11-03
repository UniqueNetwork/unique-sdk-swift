
import Foundation

public struct VerifyBody: Codable {
    public let signerPayloadJSON: SignerPayloadJSON
    public let signature: String

    public init(signerPayloadJSON: SignerPayloadJSON,
                signature: String) {
        self.signerPayloadJSON = signerPayloadJSON
        self.signature = signature
    }
}
