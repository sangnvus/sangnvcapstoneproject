package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.Dealer;

public interface DealerDao {

	public void createDealer(Dealer dealer);

	public void editDealer(Dealer dealer);

	public void deleteDealer(int dealerID);

	public Dealer getDealer(int dealerID);

	public List<Dealer> getAllDealer();

	public List<Dealer> searchDealer(String dealerName, String dealerStatus);
}
