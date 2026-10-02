-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmissionFacility" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "permitNumber" TEXT NOT NULL,
    "operator" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "reportingYear" INTEGER NOT NULL,
    "openedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmissionFacility_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmissionUnit" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "unitCode" TEXT NOT NULL,
    "process" TEXT NOT NULL,
    "fuelType" TEXT NOT NULL,
    "commissionedAt" TIMESTAMP(3) NOT NULL,
    "capacity" DOUBLE PRECISION NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmissionUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PermitCondition" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "pollutant" TEXT NOT NULL,
    "limitValue" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "averagingPeriod" TEXT NOT NULL,
    "ruleVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PermitCondition_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ActivityReading" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "emissionUnitId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "quantity" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ActivityReading_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmissionFactor" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "emissionUnitId" TEXT NOT NULL,
    "pollutant" TEXT NOT NULL,
    "factor" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "sourceVersion" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmissionFactor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StackTest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "emissionUnitId" TEXT NOT NULL,
    "testedAt" TIMESTAMP(3) NOT NULL,
    "pollutant" TEXT NOT NULL,
    "measuredValue" DOUBLE PRECISION NOT NULL,
    "unit" TEXT NOT NULL,
    "laboratory" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StackTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ControlDevice" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "emissionUnitId" TEXT NOT NULL,
    "deviceType" TEXT NOT NULL,
    "inspectionAt" TIMESTAMP(3) NOT NULL,
    "observations" TEXT NOT NULL,
    "nextDueAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ControlDevice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeviationEvent" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "emissionUnitId" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "endedAt" TIMESTAMP(3) NOT NULL,
    "cause" TEXT NOT NULL,
    "correctiveAction" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeviationEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmissionReport" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "periodStart" TIMESTAMP(3) NOT NULL,
    "periodEnd" TIMESTAMP(3) NOT NULL,
    "preparer" TEXT NOT NULL,
    "calculationReference" TEXT NOT NULL,
    "submissionReceipt" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EmissionReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "emissionFacilityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "EmissionFacility_createdAt_idx" ON "EmissionFacility"("createdAt");

-- CreateIndex
CREATE INDEX "EmissionUnit_createdAt_idx" ON "EmissionUnit"("createdAt");

-- CreateIndex
CREATE INDEX "EmissionUnit_emissionFacilityId_idx" ON "EmissionUnit"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "PermitCondition_createdAt_idx" ON "PermitCondition"("createdAt");

-- CreateIndex
CREATE INDEX "PermitCondition_emissionFacilityId_idx" ON "PermitCondition"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "ActivityReading_createdAt_idx" ON "ActivityReading"("createdAt");

-- CreateIndex
CREATE INDEX "ActivityReading_emissionFacilityId_idx" ON "ActivityReading"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "EmissionFactor_createdAt_idx" ON "EmissionFactor"("createdAt");

-- CreateIndex
CREATE INDEX "EmissionFactor_emissionFacilityId_idx" ON "EmissionFactor"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "StackTest_createdAt_idx" ON "StackTest"("createdAt");

-- CreateIndex
CREATE INDEX "StackTest_emissionFacilityId_idx" ON "StackTest"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "ControlDevice_createdAt_idx" ON "ControlDevice"("createdAt");

-- CreateIndex
CREATE INDEX "ControlDevice_emissionFacilityId_idx" ON "ControlDevice"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "DeviationEvent_createdAt_idx" ON "DeviationEvent"("createdAt");

-- CreateIndex
CREATE INDEX "DeviationEvent_emissionFacilityId_idx" ON "DeviationEvent"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "EmissionReport_createdAt_idx" ON "EmissionReport"("createdAt");

-- CreateIndex
CREATE INDEX "EmissionReport_emissionFacilityId_idx" ON "EmissionReport"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_emissionFacilityId_idx" ON "OperationalTask"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_emissionFacilityId_idx" ON "RuleVersion"("emissionFacilityId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_emissionFacilityId_idx" ON "DocumentRequirement"("emissionFacilityId");

-- AddForeignKey
ALTER TABLE "EmissionUnit" ADD CONSTRAINT "EmissionUnit_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PermitCondition" ADD CONSTRAINT "PermitCondition_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityReading" ADD CONSTRAINT "ActivityReading_emissionUnitId_fkey" FOREIGN KEY ("emissionUnitId") REFERENCES "EmissionUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ActivityReading" ADD CONSTRAINT "ActivityReading_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmissionFactor" ADD CONSTRAINT "EmissionFactor_emissionUnitId_fkey" FOREIGN KEY ("emissionUnitId") REFERENCES "EmissionUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmissionFactor" ADD CONSTRAINT "EmissionFactor_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StackTest" ADD CONSTRAINT "StackTest_emissionUnitId_fkey" FOREIGN KEY ("emissionUnitId") REFERENCES "EmissionUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StackTest" ADD CONSTRAINT "StackTest_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ControlDevice" ADD CONSTRAINT "ControlDevice_emissionUnitId_fkey" FOREIGN KEY ("emissionUnitId") REFERENCES "EmissionUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ControlDevice" ADD CONSTRAINT "ControlDevice_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviationEvent" ADD CONSTRAINT "DeviationEvent_emissionUnitId_fkey" FOREIGN KEY ("emissionUnitId") REFERENCES "EmissionUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviationEvent" ADD CONSTRAINT "DeviationEvent_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmissionReport" ADD CONSTRAINT "EmissionReport_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_emissionFacilityId_fkey" FOREIGN KEY ("emissionFacilityId") REFERENCES "EmissionFacility"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

