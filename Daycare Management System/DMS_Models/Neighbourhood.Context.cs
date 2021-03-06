﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DMS_Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class NeighbourhoodEntities : DbContext
    {
        public NeighbourhoodEntities()
            : base("name=NeighbourhoodEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }
        public virtual DbSet<AspNetRole> AspNetRoles { get; set; }
        public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }
        public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }
        public virtual DbSet<AspNetUser> AspNetUsers { get; set; }
        public virtual DbSet<Branch> Branches { get; set; }
        public virtual DbSet<Child> Children { get; set; }
        public virtual DbSet<Class> Classes { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Parent> Parents { get; set; }
    
        public virtual ObjectResult<pGetThreeClosestBranches_Result> pGetThreeClosestBranches(Nullable<double> lat, Nullable<double> @long)
        {
            var latParameter = lat.HasValue ?
                new ObjectParameter("Lat", lat) :
                new ObjectParameter("Lat", typeof(double));
    
            var longParameter = @long.HasValue ?
                new ObjectParameter("Long", @long) :
                new ObjectParameter("Long", typeof(double));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<pGetThreeClosestBranches_Result>("pGetThreeClosestBranches", latParameter, longParameter);
        }
    }
}
