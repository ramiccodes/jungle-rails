it("should render the home page", () => {
  cy.visit("/")
})

it("should click a product listing's add to cart button", () => {
  cy.get('button.btn')
  .contains("Add")
  .click({force: true})
});

it("should have added product to My Cart", () => {
  cy.get('.nav-link')
  .contains('My Cart (1)')
})

