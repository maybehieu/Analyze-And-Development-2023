package controller.paymentDAO;

import java.util.List;

import model.payment.Payment;

public interface PaymentDAO {

	void insertPaymentMethod();

	void deletePaymentMethod();

	void updatePaymentMethod();

	public List <Payment> findAllPayment();

	public Payment selectPayment(int ID);

}