import { ReactNode } from "react";
import styles from "./Header.module.css";

interface HeaderProps {
  logo: ReactNode;
  label?: string;
  children?: ReactNode;
}

export function Header({ logo, label, children }: HeaderProps) {
  return (
    <header className={styles.glassNav}>
      <div className={styles.headerContainer}>
        <div className={styles.logoArea}>
          {logo}
          {label && <span className={styles.appLabel}>{label}</span>}
        </div>
        <nav className={styles.navArea}>{children}</nav>
      </div>
    </header>
  );
}
