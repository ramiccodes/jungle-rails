it("should render the home page", () => {
  cy.visit("/")
})

it("It clicks a product listing and goes to its product page", () => {
  cy.contains("Scented Blade").click();
});