import React from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Works from a USB stick.',
    Svg: require('@site/static/img/huronOS_usb_sticks.svg').default,
    description: (
      <>
        huronOS was designed from the ground to boot from a USB stick, 
        so that you don't need to modify any institutional hardware.
        Just plug and boot!
      </>
    ),
  },
  {
    title: 'Isolates your environment in a matter of seconds.',
    Svg: require('@site/static/img/huronOS_isolated_computer.svg').default,
    description: (
      <>
        It's designed for contests like the ICPC or the IOI, easily customize your firewall.
        Ideal for official or training contest, camps and even exams!
      </>
    ),
  },
  {
    title: 'Sync up to N instances.',
    Svg: require('@site/static/img/huronOS_instance_sync.svg').default,
    description: (
      <>
        huronOS is build with synchronization in mind,
        you can use network-shared behavior directives 
        to set the same rules, software and policies 
        among huronOS instances.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
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

export default function HomepageFeatures(): JSX.Element {
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
