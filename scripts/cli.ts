require("dotenv").config();

(async function bootstrap() {
  const { FirestoreRulesCommand } = await import(
    "./commands/firestore.rules.command"
  );

  require("yargs")
    .usage("Usage: $0 <command> [options]")
    .command(new FirestoreRulesCommand())
    .demandCommand(1)
    .strict()
    .help("h")
    .options("env", {
      describe: "Env [production,staging]",
      default: "staging",
      choices: ["production", "staging"],
      alias: "e",
    })
    .alias("v", "version").argv;
})();
