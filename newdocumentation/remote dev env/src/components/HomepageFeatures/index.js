import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

const FeatureList = [
  {
    title: 'Collaborative Development',
    Svg: require('@site/static/img/team.svg').default,
    description: (
      <>
        Enable seamless collaboration among developers in a remote environment. 
        Work together on projects, share code, and communicate effectively.
      </>
    ),
  },
  {
    title: 'Secure and Isolated Environments',
    Svg: require('@site/static/img/sec.svg').default,
    description: (
      <>
        Ensure the security of your development environment with isolated instances, firewalls, and secure connections. 
        Protect your code and data from unauthorized access.
      </>
    ),
  },
  {
    title: 'Scalable and Flexible Infrastructure',
    Svg: require('@site/static/img/scalable.svg').default,
    description: (
      <>
        Scale your remote development environment effortlessly as your team grows.
        Easily add or modify instances, adjust resources, and adapt to changing project requirements.
      </>
    ),
  },
];

function Feature({Svg, title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
