using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using WeBQBCA.Models;

namespace WeBQBCA.Data;

public partial class QbcaDbContext : DbContext
{
    public QbcaDbContext()
    {
    }

    public QbcaDbContext(DbContextOptions<QbcaDbContext> options)
        : base(options)
    {
    }
    public virtual DbSet<Accoun> Accouns { get; set; }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<Notification> Notifications { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<QuestionPair> QuestionPairs { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Subject> Subjects { get; set; }

    public virtual DbSet<Task> Tasks { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserRole> UserRoles { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=DESKTOP-FMTMJO6;Initial Catalog=QBCA_DB;User ID=sa;Password=123;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Accoun>(entity =>
        {
            entity.HasKey(e => e.AccountId);

            entity.ToTable("Accoun");

            entity.Property(e => e.AccountId).ValueGeneratedNever();
            entity.Property(e => e.PasswordHash).HasMaxLength(225);
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        modelBuilder.Entity<Exam>(entity =>
        {
            entity.HasKey(e => e.ExamId).HasName("PK__Exam__297521A772801629");

            entity.ToTable("Exam");

            entity.Property(e => e.ExamId).HasColumnName("ExamID");
            entity.Property(e => e.DifficultyPercentage).HasMaxLength(100);
            entity.Property(e => e.ExamDate).HasColumnType("datetime");
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.Subject).WithMany(p => p.Exams)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Exam__SubjectID__308E3499");
        });

        modelBuilder.Entity<Notification>(entity =>
        {
            entity.HasKey(e => e.NotificationId).HasName("PK__Notifica__20CF2E327FEF2553");

            entity.ToTable("Notification");

            entity.Property(e => e.NotificationId).HasColumnName("NotificationID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.IsRead).HasDefaultValue(false);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Notifications)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__Notificat__UserI__345EC57D");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.HasKey(e => e.QuestionId).HasName("PK__Question__0DC06F8CB24CF39F");

            entity.ToTable("Question");

            entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
            entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.IsDuplicate).HasDefaultValue(false);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.CreatedByNavigation).WithMany(p => p.Questions)
                .HasForeignKey(d => d.CreatedBy)
                .HasConstraintName("FK__Question__Create__29E1370A");

            entity.HasOne(d => d.Subject).WithMany(p => p.Questions)
                .HasForeignKey(d => d.SubjectId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Question__Subjec__28ED12D1");
        });

        modelBuilder.Entity<QuestionPair>(entity =>
        {
            entity.HasKey(e => e.PairId).HasName("PK__Question__B543F62C20C12535");

            entity.Property(e => e.PairId).HasColumnName("PairID");
            entity.Property(e => e.CreatedDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.Property(e => e.RoleId).ValueGeneratedNever();
            entity.Property(e => e.RoleName).HasMaxLength(50);
        });

        modelBuilder.Entity<Subject>(entity =>
        {
            entity.HasKey(e => e.SubjectId).HasName("PK__Subject__AC1BA3884AD147EF");

            entity.ToTable("Subject");

            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");
            entity.Property(e => e.Clos).HasColumnName("CLOs");
            entity.Property(e => e.DifficultyLevel).HasMaxLength(50);
            entity.Property(e => e.SubjectName).HasMaxLength(100);
        });

        modelBuilder.Entity<Task>(entity =>
        {
            entity.HasKey(e => e.TaskId).HasName("PK__Task__7C6949D10F7B6172");

            entity.ToTable("Task");

            entity.Property(e => e.TaskId).HasColumnName("TaskID");
            entity.Property(e => e.DueDate).HasColumnType("datetime");
            entity.Property(e => e.Status).HasMaxLength(50);
            entity.Property(e => e.SubjectId)
                .HasMaxLength(20)
                .HasColumnName("SubjectID");

            entity.HasOne(d => d.AssignedToNavigation).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.AssignedTo)
                .HasConstraintName("FK__Task__AssignedTo__2CBDA3B5");

            entity.HasOne(d => d.Subject).WithMany(p => p.Tasks)
                .HasForeignKey(d => d.SubjectId)
                .HasConstraintName("FK__Task__SubjectID__2DB1C7EE");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Users__1788CCAC003FF3F4");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.Role).HasMaxLength(50);
            entity.Property(e => e.Subject).HasMaxLength(50);
            entity.Property(e => e.Username).HasMaxLength(50);
        });

        modelBuilder.Entity<UserRole>(entity =>
        {
            entity.HasKey(e => new { e.AccountId, e.RoleId });

            entity.Property(e => e.Ghichu).HasMaxLength(50);

            entity.HasOne(d => d.Account).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.AccountId)
                .HasConstraintName("FK_UserRoles_Accoun");

            entity.HasOne(d => d.Role).WithMany(p => p.UserRoles)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("FK_UserRoles_Roles");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
