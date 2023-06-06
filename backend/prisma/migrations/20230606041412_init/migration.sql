-- CreateTable
CREATE TABLE "Dodge" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "attackId" INTEGER NOT NULL,
    "imageUrl" TEXT,
    "videoUrl" TEXT,

    CONSTRAINT "Dodge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Attack" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "damage" INTEGER NOT NULL,
    "bossId" INTEGER NOT NULL,

    CONSTRAINT "Attack_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Boss" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "health" INTEGER[],

    CONSTRAINT "Boss_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Dodge" ADD CONSTRAINT "Dodge_attackId_fkey" FOREIGN KEY ("attackId") REFERENCES "Attack"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Attack" ADD CONSTRAINT "Attack_bossId_fkey" FOREIGN KEY ("bossId") REFERENCES "Boss"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
