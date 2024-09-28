module EndangeredSpeciesNFT::NFT {
    use aptos_std::signer;
    use aptos_std::string::String;

    struct NFTCollection has key, store {
        name: String,
        creator: address,
        total_supply: u64,
    }

    // Function to initialize the collection
    public fun initialize_collection(
        creator: &signer,
        name: String,
        total_supply: u64
    ) {
        let collection = NFTCollection {
            name,
            creator: signer::address_of(creator),
            total_supply,
        };
        move_to(creator, collection);
    }
}
