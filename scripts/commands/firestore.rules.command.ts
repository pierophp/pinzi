import { FirebaseHelper } from "../helpers/firebase.helper";
import { readFile } from "fs-extra";

export class FirestoreRulesCommand {
  public command = "firestore:rules";
  public describe = "Update Firestore Rules";
  public builder(yargs: any) {
    return yargs;
  }

  public async handler(argv: any) {
    process.env.NODE_ENV = argv.env;

    const firebaseAdmin = FirebaseHelper.init();

    const securityRules = await readFile("./data/firestore.rules");

    await firebaseAdmin
      .securityRules()
      .releaseFirestoreRulesetFromSource(securityRules);

    process.exit();
  }
}
