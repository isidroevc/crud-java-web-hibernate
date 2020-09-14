package com.isidroevc.hibernate.repository;

import com.isidroevc.hibernate.entity.Lead;
import org.hibernate.HibernateException;

import java.util.List;

public interface ILeadRepository {

    public long createLead(Lead lead) throws HibernateException;

    public Lead getLead(long id) throws HibernateException;

    public List<Lead> listAllLeads() throws HibernateException;

}