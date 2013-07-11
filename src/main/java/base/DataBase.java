package base;

import base.entities.*;
import util.FilterGenerator;
import util.SortingGenerator;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.sql.Timestamp;
import java.util.*;

public class DataBase {

    private static EntityManager getAuthEM()
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("authPU");
        return emf.createEntityManager();
    }

    private static EntityManager getClaimsEM()
    {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("persUnit");
        return emf.createEntityManager();
    }

    public static void deleteUsers(String[] names)
    {
        EntityManager em = getAuthEM();
        EntityManager iem = getClaimsEM();
        em.getTransaction().begin();
        iem.getTransaction().begin();
        for ( String name : names)
        {
            UsersEntity user = em.find(UsersEntity.class, name);
            em.remove(user);
            UserinfoEntity uinfo = iem.find(UserinfoEntity.class, name);
            if ( uinfo != null)
                iem.remove(uinfo);
        }
        em.getTransaction().commit();
        iem.getTransaction().commit();
    }
    public static void addUser( Map<String,String[]> parameters)
    {
        EntityManager em = getAuthEM();
        EntityManager infoEm = getClaimsEM();
        em.getTransaction().begin();
        infoEm.getTransaction().begin();
        UsersEntity user = new UsersEntity();
        user.setUserName(parameters.get("user_name")[0]);
        user.setUserPass(parameters.get("user_pass")[0]);

        List<String> roles = new ArrayList<String>();
        roles.add(parameters.get("user-role")[0]);

        user.setRoles(roles);

        UserinfoEntity uinfo = new UserinfoEntity();

        uinfo.setUserName(parameters.get("user_name")[0]);
        uinfo.setName(parameters.get("name")[0]);
        uinfo.setSurname(parameters.get("surname")[0]);
        uinfo.setMiddleName(parameters.get("middle_name")[0]);
        uinfo.setBuilding(infoEm.find(BuildingsEntity.class, Integer.parseInt(parameters.get("building")[0])));
        uinfo.setUnit(infoEm.find(UnitsEntity.class, Integer.parseInt(parameters.get("unit")[0])));
        uinfo.setTelephone(parameters.get("telephone")[0]);

        
        em.persist(user);
        infoEm.persist(uinfo);
        em.getTransaction().commit();
        infoEm.getTransaction().commit();
    }

    public static Integer addClaim( Map<String, String[]> params, String user)
    {
        EntityManager em = getClaimsEM();
        em.getTransaction().begin();
        ClaimsEntity clm = new ClaimsEntity();
        clm.setCreatorLogin(user);
        clm.setName(params.get("name")[0]);
        clm.setMiddleName(params.get("middle_name")[0]);
        clm.setSurname(params.get("surname")[0]);
        clm.setTelephone(params.get("telephone")[0]);
        if ( params.get("building") != null &&
             !params.get("building")[0].isEmpty() )
        {
            clm.setBuilding( em.find(BuildingsEntity.class,
                                     Integer.parseInt(params.get("building")[0])));
        }
        if ( params.get("unit") != null &&
                !params.get("unit")[0].isEmpty() )
        {
            clm.setUnit( em.find(UnitsEntity.class,
                                 Integer.parseInt(params.get("unit")[0])));
        }
        clm.setRoom(params.get("room")[0]);
        clm.setDeviceType(params.get("device_type")[0]);
        clm.setDeviceNumber(params.get("device_number")[0]);
        clm.setProblemDescription(params.get("problem_description")[0]);
        if ( params.get("type") != null &&
                !params.get("type")[0].isEmpty() )
        {
            clm.setType(em.find(ClaimTypeEntity.class,
                                Integer.parseInt(params.get("type")[0])));
        }
        if ( params.get("priority") != null &&
                !params.get("priority")[0].isEmpty() )
        {
            clm.setPriority(em.find(PrioritiesEntity.class,
                    Integer.parseInt(params.get("priority")[0])));
        }
        clm.setComment(params.get("comment")[0]);
        clm.setServiceNumber(params.get("service_number")[0]);
        clm.setCreated(new Timestamp(new Date().getTime()));
        clm.setUpdated(new Timestamp(new Date().getTime()));
        clm.setStatus(em.find(StatusesEntity.class, 1));
        em.persist( clm);
        em.getTransaction().commit();

        return clm.getId();
    }

    public static ClaimsEntity generateClaimByUser( String userName)
    {
        EntityManager em = getClaimsEM();
        UserinfoEntity user = em.find(UserinfoEntity.class, userName);

        ClaimsEntity ret = new ClaimsEntity();
        if ( user != null)
        {
            ret.setName(user.getName());
            ret.setMiddleName(user.getMiddleName());
            ret.setSurname(user.getSurname());
            ret.setTelephone(user.getTelephone());
            ret.setUnit(user.getUnit());
            ret.setBuilding(user.getBuilding());
            ret.setCreatorLogin(user.getUserName());
        }

        return ret;
    }

    private static List<UsersEntity> keepOnlyRelevantUsers( List<UsersEntity> users)
    {
        List<UsersEntity> ret = new ArrayList<UsersEntity>(users.size());
        for ( UsersEntity user : users)
            if ( user.getRoles().contains("manager") ||
                 user.getRoles().contains("customer") ||
                 user.getRoles().contains("performer") )
                ret.add(user);
        return ret;
    }

    public static List<UsersEntity> listUsers(Map<String, String[]> params)
    {
        EntityManager em = getAuthEM();
        List<UsersEntity> ret =  em.createQuery("select u from UsersEntity u " +
                new FilterGenerator(params).variable("u").generate() +
                new SortingGenerator(params).variable("u").generate()).getResultList();
        return keepOnlyRelevantUsers(ret);
    }

    public static List<UserinfoEntity> listUserinfos(Map<String, String[]> params)
    {
        EntityManager em = getClaimsEM();
        List<UserinfoEntity> ret =  em.createQuery("select u from UserinfoEntity u " +
                new FilterGenerator(params).variable("u").generate() +
                new SortingGenerator(params).variable("u").generate()).getResultList();
        return ret;
    }

    public static List<ClaimsEntity> listClaims(Map<String, String[]> params)
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select m from ClaimsEntity m " +
                               new FilterGenerator(params).variable("m").generate() +
                               new SortingGenerator(params).variable("m").generate()).getResultList();
    }

    public static ClaimsEntity getClaim( Integer id)
    {
        EntityManager em = getClaimsEM();
        return em.find(ClaimsEntity.class, id);
    }

    public static UserinfoEntity getUserInfo( String userName)
    {
        EntityManager em = getClaimsEM();
        UserinfoEntity user = em.find(UserinfoEntity.class, userName);
        return user;
    }

    public static UsersEntity getUserAcc( String userName)
    {
        EntityManager em = getAuthEM();
        UsersEntity user = em.find(UsersEntity.class, userName);
        return user;
    }


    public static List<TownsEntity> listTowns()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select t from TownsEntity t").getResultList();
    }

    public static void addTown( String name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = new TownsEntity();
        town.setName(name);
        em.persist(town);
        em.getTransaction().commit();
    }

    private static void detachBuilding( BuildingsEntity building, EntityManager em)
    {
        for (ClaimsEntity claim: building.getClaims())
            em.remove(claim);
        for (UserinfoEntity user : building.getUsers())
        {
            user.setBuilding(null);
            em.persist(user);
        }
    }

    public static void deleteTown( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = em.find(TownsEntity.class, id);
        for (BuildingsEntity building: town.getBuildings())
        {
            detachBuilding( building, em);
            em.remove(building);
        }
        em.remove(town);
        em.getTransaction().commit();
    }

    public static void addBuildings( String[] names, String town_name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        TownsEntity town = (TownsEntity)em.createQuery("select t from TownsEntity t where t.name = '" +
                                    town_name + "'").getSingleResult();
        for ( String name : names)
        {
            BuildingsEntity building = new BuildingsEntity();
            building.setName(name);
            em.persist(building);
            town.getBuildings().add(building);
        }
        em.persist(town);
        em.getTransaction().commit();
    }

    public static void deleteBuilding( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        BuildingsEntity building = em.find(BuildingsEntity.class, id);
        detachBuilding(building, em);
        em.remove(building);
        em.getTransaction().commit();
    }

    public static void addUnit( String name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        UnitsEntity unit = new UnitsEntity();
        unit.setName(name);
        em.persist(unit);
        em.getTransaction().commit();
    }

    public static void deleteUnit( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        UnitsEntity unit = em.find(UnitsEntity.class, id);
        for (ClaimsEntity claim : unit.getClaims())
            em.remove(claim);
        for (UserinfoEntity user : unit.getUsers())
        {
            user.setUnit(null);
            em.persist(user);
        }
        em.remove(unit);
        em.getTransaction().commit();
    }

    public static void addClaimType( String name)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        ClaimTypeEntity type = new ClaimTypeEntity();
        type.setName( name);
        em.persist(type);
        em.getTransaction().commit();
    }

    public static void deleteClaimType( Integer id)
    {
        EntityManager em = getClaimsEM();

        em.getTransaction().begin();
        ClaimTypeEntity type = em.find(ClaimTypeEntity.class, id);
        for (ClaimsEntity claim : type.getClaims())
        {
            claim.setType(null);
            em.persist(claim);
        }
        em.remove(type);
        em.getTransaction().commit();
    }

    public static List<UnitsEntity> listUnits()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select u from UnitsEntity u").getResultList();
    }

    public static List<PrioritiesEntity> listPriorities()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select p from PrioritiesEntity p").getResultList();
    }

    public static List<ClaimTypeEntity> listClaimTypes()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select ct from ClaimTypeEntity ct").getResultList();
    }

    public static List<StatusesEntity> listStatuses()
    {
        EntityManager em = getClaimsEM();
        return em.createQuery("select s from StatusesEntity s").getResultList();
    }
}
