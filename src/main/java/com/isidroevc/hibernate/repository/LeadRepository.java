package com.isidroevc.hibernate.repository;

import com.isidroevc.hibernate.repository.CommonRepository;
import com.isidroevc.hibernate.entity.Lead;
import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.hibernate.Session;
import java.util.List;

public class LeadRepository extends CommonRepository implements ILeadRepository {

    @Override
    public long createLead(Lead lead) throws HibernateException {
        return super.saveEntity(lead);
    }

    @Override
    public Lead getLead(long id) throws HibernateException {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction transaction = session.beginTransaction();
        try {
            Lead lead = (Lead)session.get(Lead.class, new Long(id));
            transaction.commit();
            return lead;
        }catch (Exception ex) {
            transaction.rollback();
            throw ex;
        } finally {
            session.close();
        } 
    }

    @Override
    public List<Lead> listAllLeads() throws HibernateException {
        Session session = this.sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
        try {
            List<Lead> leads = session.createCriteria(Lead.class).list();
            transaction.commit();
            return leads;
        }catch (Exception ex) {
            transaction.rollback();
            throw ex;
        } finally {
            session.close();
        } 
    }

    public void deleteLead(long id) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Lead lead = (Lead)session.get(Lead.class, new Long(id));
            if (lead == null) {
                return;
            }
            System.out.println(lead.getFirstName());
            session.remove(lead);
            transaction.commit();
        }catch (Exception ex) {
            transaction.rollback();
            throw ex;
        } finally {
            session.close();
        }      
    }

    public void updateLead(Lead lead) {
        Session session = this.sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            session.update(lead);
            transaction.commit();
        }catch (Exception ex) {
            transaction.rollback();
            throw ex;
        } finally {
            session.close();
        }  
    }

}