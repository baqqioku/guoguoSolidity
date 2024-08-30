// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureContract {
    // 定义事件以记录成功和失败的调用
    event CallSuccess(address target, bytes data);
    event CallFailure(address target, bytes data, string reason);

    /**
     * @dev 安全调用外部合约函数并验证签名
     * @param target 外部合约的地址
     * @param data 调用外部合约的函数数据
     * @param signer 预期的签名者地址
     * @param messageHash 消息的哈希值
     * @param signature 签名数据
     */
    function safeCallWithSignatureVerification(
        address target,
        bytes memory data,
        address signer,
        bytes32 messageHash,
        bytes memory signature
    ) public {
        // 签名验证
        require(verifySignature(signer, messageHash, signature), "Invalid signature");

        // 使用 try/catch 进行外部调用，确保安全
        (bool success, bytes memory returnData) = target.call(data);

        if (success) {
            emit CallSuccess(target, data);
        } else {
            // 处理调用失败，记录错误原因
            string memory reason = _getRevertMsg(returnData);
            emit CallFailure(target, data, reason);
        }
    }

    /**
     * @dev 验证消息签名
     * @param signer 预期的签名者地址
     * @param messageHash 消息的哈希值
     * @param signature 签名数据
     * @return bool 签名是否有效
     */
    function verifySignature(
        address signer,
        bytes32 messageHash,
        bytes memory signature
    ) internal pure returns (bool) {
        // 通过 ecrecover 函数从签名中恢复地址
        bytes32 ethSignedMessageHash = getEthSignedMessageHash(messageHash);
        (bytes32 r, bytes32 s, uint8 v) = splitSignature(signature);
        address recoveredSigner = ecrecover(ethSignedMessageHash, v, r, s);
        return (recoveredSigner == signer);
    }

    /**
     * @dev 获取以太坊签名消息哈希
     * @param _messageHash 消息的哈希值
     * @return bytes32 以太坊签名消息哈希
     */
    function getEthSignedMessageHash(bytes32 _messageHash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
    }

    /**
     * @dev 拆分签名数据为 r, s, v
     * @param sig 签名数据
     * @return (bytes32 r, bytes32 s, uint8 v) 签名的 r, s, v 部分
     */
    function splitSignature(bytes memory sig)
        internal
        pure
        returns (bytes32, bytes32,uint8)
    {
        require(sig.length == 65, "Invalid signature length");

        bytes32 r;
        bytes32 s;
        uint8 v;

        assembly {
            r := mload(add(sig, 32))
            s := mload(add(sig, 64))
            v := byte(0, mload(add(sig, 96)))
        }

        return (r, s, v);
    }


    /**
     * @dev 提取外部调用失败的错误信息
     * @param _returnData 调用返回的数据
     * @return string 错误信息
     */
    function _getRevertMsg(bytes memory _returnData) internal pure returns (string memory) {
        if (_returnData.length < 68) return 'Transaction reverted silently';

        assembly {
            _returnData := add(_returnData, 0x04)
        }
        return abi.decode(_returnData, (string));
    }

    function getMessageHash(string memory message) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(message));
    }
}
