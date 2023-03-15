// SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 < 0.9.0;

contract PokemonFactory{
    //creating event
    event NewPokemon(uint pokemonId, string name, uint dna);
    //declaring variables to randomize pokemon
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    //creating pokemon struct
    struct Pokemon {
        string name;
        uint dna;
    }
    //mapping pokemon to owner and counter for pokemon owned
    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;



    //creating array of pokemon
    Pokemon[] public pokemons;



    //creating pokemon
    function _createPokemon(string memory _name, uint _dna) public {
        pokemons.push(Pokemon(_name, _dna));
        uint id = pokemons.length - 1;
        pokemonToOwner[id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit NewPokemon(id, _name, _dna);
    }
    //randomizing pokemon
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
    //creating pokemon
    function createRandomPokemon(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createPokemon(_name, randDna);
    }
    //getting pokemon´s
    function getPokemon() public view returns (Pokemon[] memory) {
        
        return (pokemons);
    }
}