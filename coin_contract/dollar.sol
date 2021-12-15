// SPDX-License-Identifier: MIT

import './memecoin.sol';

// A personally defined ERC-720 token (Shitcoin) to be used for a custom 'memecoin' ;)
// NAME ME A BETTER MEMECOIN ;)

contract Dollar is Memecoin {
    
    constructor() Memecoin("Dollar", "$") {
        _mint(msg.sender, 100000); // Minting a hundred thousand dollars!
    }
}