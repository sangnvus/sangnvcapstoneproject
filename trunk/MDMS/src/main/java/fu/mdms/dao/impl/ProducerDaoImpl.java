package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.ProducerDao;
import fu.mdms.model.Category;
import fu.mdms.model.Producer;
import fu.mdms.util.HibernateUtil;

public class ProducerDaoImpl implements ProducerDao{
	public void createProducer(Producer producer){}

	public void editProducer(Producer producer){}

	public void deleteProducer(int producerID){}

	public Producer getProducer(int producerID){
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		Producer producer = (Producer) session.get(Producer.class, producerID);
		session.getTransaction().commit();
		session.close();
		return producer;
	}	

	@SuppressWarnings("unchecked")
	public List<Producer> getAllProducer(){ 
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Producer> producer = (List<Producer>) session.createQuery(
				"FROM Producer").list();
		session.getTransaction().commit();
		session.close();
		return producer;
	}

	public List<Producer> searchProducer(String ProducerName){return null;}

}