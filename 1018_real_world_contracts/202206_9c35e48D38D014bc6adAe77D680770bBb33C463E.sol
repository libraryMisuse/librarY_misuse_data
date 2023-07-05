// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./Base64.sol";

contract ShitPlungerRenderer {
    string public constant IMAGE_DATA =
        "data:image/webp;base64,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";

    function render() external pure returns (string memory) {
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        abi.encodePacked(
                            '{"name":"ShitPlunger",',
                            '"description":"The best shit plunger you can get on the market!",',
                            '"image":"',
                            IMAGE_DATA,
                            '"}'
                        )
                    )
                )
            );
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

library Base64 {
    string constant private B64_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

    function encode(bytes memory _data) internal pure returns (string memory result) {
        if (_data.length == 0) return '';
        string memory _table = B64_ALPHABET;
        uint256 _encodedLen = 4 * ((_data.length + 2) / 3);
        result = new string(_encodedLen + 32);

        assembly {
            mstore(result, _encodedLen)
            let tablePtr := add(_table, 1)
            let dataPtr := _data
            let endPtr := add(dataPtr, mload(_data))
            let resultPtr := add(result, 32)

            for {} lt(dataPtr, endPtr) {}
            {
                dataPtr := add(dataPtr, 3)
                let input := mload(dataPtr)
                mstore(resultPtr, shl(248, mload(add(tablePtr, and(shr(18, input), 0x3F)))))
                resultPtr := add(resultPtr, 1)
                mstore(resultPtr, shl(248, mload(add(tablePtr, and(shr(12, input), 0x3F)))))
                resultPtr := add(resultPtr, 1)
                mstore(resultPtr, shl(248, mload(add(tablePtr, and(shr(6, input), 0x3F)))))
                resultPtr := add(resultPtr, 1)
                mstore(resultPtr, shl(248, mload(add(tablePtr, and(input, 0x3F)))))
                resultPtr := add(resultPtr, 1)
            }

            switch mod(mload(_data), 3)
            case 1 {mstore(sub(resultPtr, 2), shl(240, 0x3d3d))}
            case 2 {mstore(sub(resultPtr, 1), shl(248, 0x3d))}
        }

        return result;
    }
}