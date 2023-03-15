const { expect } = require("chai");



describe("Pokemon contract", function () {

    it("Pokemon Factory work's good", async function () {

        
        

        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");

        const hardhatPokemon = await PokemonFactory.deploy();
        await hardhatPokemon._createPokemon("Pik",3)
        await hardhatPokemon._createPokemon("Pog",3)

        const pokemons = await hardhatPokemon.getPokemon();
        

        expect(pokemons.length).to.equal(2);

    });
});
