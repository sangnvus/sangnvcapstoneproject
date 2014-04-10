package fu.mdms.dao;

import java.util.List;

import fu.mdms.model.Producer;

public interface ProducerDao {

	public void createProducer(Producer producer);

	public void editProducer(Producer producer);

	public void deleteProducer(int producerID);

	public Producer getProducer(int producerID);

	public List<Producer> getAllProducer();

	public List<Producer> searchProducer(String producerName);
}
