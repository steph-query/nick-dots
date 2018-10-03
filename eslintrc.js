module.exports = {
  extends: [
    "kentcdodds",
    "kentcdodds/possible-errors",
    "kentcdodds/best-practices",
    "kentcdodds/import",
    "kentcdodds/stylistic",
    "kentcdodds/jest",
    "kentcdodds/jsx-a11y",
    "kentcdodds/react",
    "kentcdodds/webpack"
  ],
  rules: {
    semi: ["error", "never"],
    "no-shadow": "off",
    "babel/no-invalid-this": 1,
    "no-invalid-this": 0
  }
}
