import * as firebaseAdmin from "firebase-admin";

export class FirebaseHelper {
  static init() {
    const param = `FIREBASE_CREDENTIAL_${process.env.NODE_ENV.toUpperCase()}`;
    if (!process.env[param]) {
      throw new Error(`${param} not configured`);
    }

    const firebaseCredential = Buffer.from(
      process.env[param] as string,
      "base64"
    ).toString("ascii");

    const firebaseCredentialObject = JSON.parse(firebaseCredential);

    firebaseAdmin.initializeApp({
      credential: firebaseAdmin.credential.cert(firebaseCredentialObject),
    });

    return firebaseAdmin;
  }
}
