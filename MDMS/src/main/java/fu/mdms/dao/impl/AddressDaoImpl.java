package fu.mdms.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import fu.mdms.dao.AddressDao;
import fu.mdms.model.Dealer;
import fu.mdms.model.District;
import fu.mdms.model.Province;
import fu.mdms.util.HibernateUtil;

public class AddressDaoImpl implements AddressDao {

	@Override
	public List<Province> getAllProvinces() {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<Province> province = (List<Province>) session.createQuery("FROM Province").list();
		session.getTransaction().commit();
		session.close();
		return province;
	}

	@Override
	public List<District> getDistricts(String  provinceID) {
		// TODO Auto-generated method stub
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		List<District> district = (List<District>) session.createQuery("FROM District WHERE ProvinceID = '"+provinceID+"'").list();
		session.getTransaction().commit();
		session.close();
		return district;
	}
	public District getDistrict(String districtID)
	{
		SessionFactory sf = HibernateUtil.getSessionFactory();
		Session session = sf.openSession();
		session.beginTransaction();
		District district= (District) session.get(District.class, districtID);
		session.getTransaction().commit();
		session.close();
		return district;
	}

}
