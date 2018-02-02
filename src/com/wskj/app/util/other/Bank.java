package com.wskj.app.util.other;

import javax.jws.WebService;

import org.springframework.stereotype.Component;

@Component
@WebService(targetNamespace = "com.wskj.app.ws.Bank")
public interface Bank {
	/**
	 * 获取余额
	 * 
	 * @param cardId
	 * @param pwd
	 * @return
	 */
	Float getBalance(String cardId, String pwd);

	/**
	 * 检查银行卡
	 * 
	 * @param cardId
	 * @param userName
	 * @param pwd
	 * @return
	 */
	Integer checkBankCard(String cardId, String userName, String pwd);

	/**
	 * 充值
	 * 
	 * @param cardId
	 * @param pwd
	 * @param money
	 * @return
	 */
	Integer minusMoney(String cardId, String pwd, Float money);
}
